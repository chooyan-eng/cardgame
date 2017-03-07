require 'util/data_io'
require 'handler/handler'
require 'messenger/messenger'

COMMANDS = ["init", "join", "status", "use", "choose"]

command = ARGV.empty? ? 'status' : ARGV[0]
unless COMMANDS.include? command
  exit
end

handler = Handler.create(command, ARGV.slice(1, ARGV.size - 1))
handler.exec

messenger = Messenger.create(handler.result.type)
messenger.out(handler.result.messages)

handler.save
