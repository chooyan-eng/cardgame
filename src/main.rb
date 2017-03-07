require 'util/data_io'
require 'handler/handler'
require 'handler/init'

COMMANDS = ["init", "join", "status", "use", "choose"]

command = ARGV.empty? ? 'status' : ARGV[0]
unless COMMANDS.include? command
  exit
end

handler = Handler.create(command)
handler.exec

# messenger = Messanger.create(handler.result.type)
# messenger.out(handler.result.data)

handler.save
