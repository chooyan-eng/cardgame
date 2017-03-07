require 'const'

module Util
  class Statuscheck
    def self.game_initialized?
      DATA_DIR.children.empty?
    end

    def self.game_started?
      DATA_DIR.children.size >= 2
    end

    def self.existing_data
      DATA_DIR.children
    end
  end
end
