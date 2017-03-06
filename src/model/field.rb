module Model
  class Field
    attr_reader :players, :cards, :current_player

    def initialize(players, cards, current_player = nil)
      @players = players
      @cards = cards
      if (current_player.nil? && players.size > 0) then
        @current_player = @players[0].name
      else
        @current_player = current_player
      end
    end

    def next
      next_index = @players.find_index(current_player) + 1
      next_index = next_index % @players.size
      @current_player = @players[next_index].name
    end

    def pick_card(card_level)
      card = choose_randomly(@cards[card_level])
      pick(@cards[card_level], card)
      card
    end

    private
    def choose_randomly(cards)
      cards.sample
    end

    def pick(cards, target_card)
      card_index = cards.find_index(target_card)
      cards.delete_at(card_index)
    end
  end
end
