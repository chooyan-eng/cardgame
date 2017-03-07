module Messenger
  class Init
    def out(messages)
      messages.each do |message|
        puts ""
        case message.id
        when "200"
          puts "[dryrun mode] You already have data listed below."
          puts ""
          message.args.each { |arg| puts "  - #{arg}" }
          puts ""
          puts "If you are sure to delete all the data, type `init y`"
        when "201"
          puts "The game was initialized. Data listed below were deleted."
          puts ""
          message.args.each { |arg| puts "  - #{arg}" }
        when "400"
          puts "The game is already initialized. You don't have to init any more."
        end
      end
      puts ""
    end
  end
end
