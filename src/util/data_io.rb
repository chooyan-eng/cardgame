require 'etc'
require 'pathname'
require 'json'
require 'model/player'

module Util
  class DataIo
    DATA_DIR = Pathname.pwd.join("data")
    MY_FILE = DATA_DIR.join("#{Etc.getlogin}.txt")

    def self.save_player(player)
      player_hash = player_hash(player)
      MY_FILE.write(JSON.dump(player_hash))
    end
    
    def self.load_player()
      return Model::Player.new unless MY_FILE.exist?

      player_hash = JSON.parse(MY_FILE.read)
      player_obj(player_hash)
    end

    private
    def self.player_hash(player_obj)
      hash = {}
      hash["money"] = player_obj.money
      hash["jobs"] = player_obj.jobs
      hash["cards"] = player_obj.cards
      hash
    end

    def self.player_obj(player_hash)
      Model::Player.new(
                player_hash["money"], 
                player_hash["jobs"], 
                player_hash["cards"])
    end
  end
end
