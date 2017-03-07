require 'test/unit'
require 'handler/handler'
require 'handler/init'
require 'handler/join'
require 'handler/status'
require 'handler/use'
require 'handler/choose'
require 'handler/error'

class TestHandler < Test::Unit::TestCase
  def test_create_init_handler_instance
    handler = Handler.create("init")
    assert_true(handler.is_a?(Handler::Init))
  end

  def test_create_join_handler_instance
    handler = Handler.create("join")
    assert_true(handler.is_a?(Handler::Join))
  end

  def test_create_status_handler_instance
    handler = Handler.create("status")
    assert_true(handler.is_a?(Handler::Status))
  end

  def test_create_use_handler_instance
    handler = Handler.create("use")
    assert_true(handler.is_a?(Handler::Use))
  end

  def test_create_choose_handler_instance
    handler = Handler.create("choose")
    assert_true(handler.is_a?(Handler::Choose))
  end

  def test_create_error_handler_instance
    handler = Handler.create("error")
    assert_true(handler.is_a?(Handler::Error))
  end
end
