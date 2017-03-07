require 'model/player'
require 'model/field'
require 'util/data_io'

COMMANDS = ["init", "join", "status", "use", "choose"]

command = ARGV.empty? ? 'status' : ARGV[0]
unless COMMANDS.include? command
  exit
end

handler = Hander.create(command)
handler.exec

messenger = Messanger.create(handler.result.type)
messenger.out(handler.result.data)

handler.save
