module Handler
  def self.create(command, command_args = [])
    case command
    when "init"
      Handler::Init.new(command_args)
    when "join"
      Handler::Join.new(command_args)
    when "status"
      Handler::Status.new(command_args)
    when "use"
      Handler::Use.new(command_args)
    when "choose"
      Handler::Choose.new(command_args)
    else
      Handler::Error.new(command, command_args)
    end
  end
end
