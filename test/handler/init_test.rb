require 'test/unit'
require 'handler/init'

class TestInitHandler < Test::Unit::TestCase

  def test_obtain_200_when_dryrun
    handler = Handler::Init.new("n")
    handler.exec
    assert_equal("200", handler.result.messages[0].id)
  end
end
