require 'messenger/init'
require 'messenger/join'
require 'messenger/error'

module Messenger
  def self.create(type)
    case type
    when "init"
      Messenger::Init.new
    when "join"
      Messenger::Join.new
    else
      Messenger::Error.new
    end
  end
end
