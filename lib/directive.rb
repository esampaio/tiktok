module TikTok
  class Directive
    attr_reader :name, :expression, :method

    def initialize(name, expression, method)
      @name = name
      @expression = expression
      @method = method
    end

    def execute(message)
      Cog.cogs[@name].send(@method, message) if @expression.match(message.body)
    end
  end
end
