module TikTok
  class Cog
    @cogs = {}
    @listeners = {}
    class << self
      attr_reader :cogs, :listeners

      def inherited(child)
        Cog.cogs[child.to_s] = child
      end

      def on_listen(message, *methods)
        methods.each do |method|
          Cog.listeners[self.to_s] = Directive.new(self.to_s, message, method)
        end
      end
    end
  end
end
