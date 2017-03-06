require 'test/unit'
require 'model/field'
require 'test_helper'

class TestField < Test::Unit::TestCase

  def test_can_point_first_player
    field = new_field_data
    assert_equal(field.current_player, field.players[0].name)
  end

  def test_can_point_next_player
    field = new_field_data
    field.next
    assert_equal(field.current_player, field.players[1].name)
  end

  def test_can_pick_a_card
    field = new_field_data
    field.pick_card(0)
    assert_equal(2, field.cards[0].size)
  end
end
