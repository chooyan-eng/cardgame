module Handler
  class Result
    class Message
      attr_accessor :id, :args
      def initialize(id, args)
        @id = id
        @args = args
      end
    end

    attr_reader :messages
    attr_accessor :type

    def initialize
      @type = nil
      @messages = []
    end

    def push(message_id, args = nil)
      @messages.push(Message.new(message_id, args))
    end 
  end
end
