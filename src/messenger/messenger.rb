require 'messenger/init'
require 'messenger/error'

module Messenger
  def self.create(type)
    case type
    when "init"
      Messenger::Init.new
    else
      Messenger::Error.new
    end
  end
end
