require 'test/unit'
require 'model/field'

class TestField < Test::Unit::TestCase

  def test_can_point_first_player
    field = new_field
    assert_equal(field.current_player, field.players[0])
  end

  def test_can_point_next_player
    field = new_field
    field.next
    assert_equal(field.current_player, field.players[1])
  end

  def test_can_pick_a_card
    field = new_field
    field.pick_card(0)
    assert_equal(2, field.cards[0].size)
  end

  private
  def new_field
    Model::Field.new(
      [Model::Player.new(300, [], []), Model::Player.new(200, [], [])],
      [[1, 2, 3], [4, 5], [6, 6, 7, 7]])
  end
end
