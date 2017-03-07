require 'test/unit'
require 'messenger/messenger'

class TestMessenger < Test::Unit::TestCase
  def test_create_init_messenger
    messenger = Messenger.create("init")
    assert_true(messenger.is_a?(Messenger::Init))
  end
end
