require 'i18n'

module Messenger
  class Join
    def out(messages)
      puts ""
      messages.each do |message|
        case message.id
        when "200"
          if message.args.nil? || message.args.empty? then
            puts I18n.t(:join_200_1)
          else
            puts I18n.t(:join_200_2, {player: message.args[0]})
          end
        when "201"
          puts I18n.t(:join_201_1, {player: message.args})
        when "202"
          puts I18n.t(:join_202_1, {player: message.args[0]})
        when "203"
          puts I18n.t(:join_203_1, {player1: message.args[0], player2: message.args[1]})
        when "204"
          puts I18n.t(:join_204_1)
        when "205"
          puts I18n.t(:join_205_1)
        when "400"
          puts I18n.t(:join_400_1, {player1: message.args[0], player2: message.args[1]})
        end
      end
      puts ""
    end
  end
end
