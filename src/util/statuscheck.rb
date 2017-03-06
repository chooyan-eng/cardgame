module Util
  class Statuscheck
    def self.game_started?
      DATA_DIR.children.size >= 2
    end
  end
end
