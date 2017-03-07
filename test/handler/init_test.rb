require 'test/unit'
require 'handler/init'

class TestInitHandler < Test::Unit::TestCase
  def test_obtain_400_when_already_initialized
    handler = Handler::Init.new([])
    def handler.already_initialized?
      true
    end
    handler.exec
    assert_equal("400", handler.result.messages[0].id)
  end

  def test_obtain_200_when_dryrun
    handler = Handler::Init.new([])
    def handler.already_initialized?
      false
    end
    handler.exec
    assert_equal("200", handler.result.messages[0].id)
  end
  
  def test_obtain_201_when_real_run
    handler = Handler::Init.new(["y"])
    def handler.already_initialized?
      false
    end
    handler.exec
    assert_equal("201", handler.result.messages[0].id)
  end

  def test_illegal_argument_is_recognized_as_dryrun
    handler = Handler::Init.new(["hogehoge"])
    def handler.already_initialized?
      false
    end
    handler.exec
    assert_equal("200", handler.result.messages[0].id)
  end
end
