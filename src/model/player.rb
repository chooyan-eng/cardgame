module Model
  class Player
    attr_reader :money, :jobs, :cards

    def initialize()
      @money = 0
      @jobs = []
      @cards = []
      @multiple_job = false
    end

    def gain_money(amount)
      @money += amount
    end

    def lose_money(amount)
      @money -= amount
      @money = [@money, 0].max
    end

    def gain_job(job_id)
      @jobs.push(job_id) if @jobs.empty? || job_multiplied? 
    end

    def lose_job(job_id)
      index = @jobs.find_index(job_id)
      @jobs.delete_at(index) unless index.nil?
    end

    def gain_card(card_id)
      @cards.push(card_id)
    end

    def lose_card(card_id)
      index = @cards.find_index(card_id)
      @cards.delete_at(index) unless index.nil?
    end

    def job_multiply
      @multiple_job = true
    end

    def job_multiplied?
      @multiple_job
    end
  end
end
