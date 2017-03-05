module Model
  class Player
    attr_reader :money, :job, :cards

    def initialize(money, job, cards)
      @money = money, @job = job, @cards = cards 
    end

    def gain_money(amount)
      @money += amount
    end

    def lose_money(amount)
      @money -= amount
    end

    def gain_job(job_id)
      @job = job_id
    end

    def lose_job()
      @job = nil
    end

    def gain_card(card_id)
      cards = [] if cards.nil?
      cards.add(card_id)
    end

    def lose_card(card_id)
      index = cards.find_index(card_id)
      cards.delete_at(index) unless index.nil?
    end
  end
end
