$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'cogs'))
require 'rubygems'
require 'singleton'
require 'tinder'
require 'yaml'
require 'cog'
require 'directive'

module TikTok
  class Bot
    include Singleton
    attr_reader :campfire, :config, :rooms

    def initialize
      @config   = YAML::load(File.read(File.join(File.dirname(__FILE__), '..', 'config', 'config.yml')))
    end

    def run
      raise Exception.new("Must have a subdomain and an API Token to run.") if  ( @config['subdomain'].nil? || @config['token'].nil? )
      @campfire = Tinder::Campfire.new @config['subdomain'], :token => @config['token']
      join_rooms
      load_cogs
      loop do
        begin
          @rooms.each_pair do |name,room|
            room.listen do |message|
              handle_message message.merge({:room => room})
            end
          end
        rescue
          puts $!
        end
      end
    end
    
    def join_rooms
      @rooms = {}
      @config['rooms'].each do |room|
        @rooms[room] = @campfire.find_room_by_name room
        raise Exception.new("Couldnt find room '#{room}'") if @rooms[room].nil?
        @rooms[room].join
        @rooms[room].play 'live'
      end
    end

    def handle_message(message)
      case message[:type]
        when "TextMessage", "PasteMessage"
          unless message[:user][:id] == @campfire.me[:id]
            Cog.listeners.each_pair do |cog, directive|
              directive.execute(message)
            end
          end
      end
    end

    def load_cogs
      @config['cogs'].each do |cog|
        load cog
      end

      Cog.cogs.each_pair do |name, klass|
        Cog.cogs[name] = klass.new
      end
    end
  end
end
