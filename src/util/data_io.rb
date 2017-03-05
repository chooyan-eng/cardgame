require 'etc'
require 'pathname'
require 'json'
require 'model/player'

module Util
  class DataIo
    DATA_DIR = Pathname.pwd.join("data")
    MY_DIR = DATA_DIR.join(Etc.getlogin)

    def self.save_player(player)
      MY_DIR.mkdir unless MY_DIR.exist?
      save_player_private(player)
      save_player_public(player)
    end
    
    def self.load_player(player_name)
      player_dir = DATA_DIR.join(player_name)
      player_hash = JSON.parse(player_dir.join("public.txt").read)
      if (me?(player_name)) then
        player_hash["cards"] = JSON.parse(player_dir.join("private.txt").read)
      end
      player_obj(player_hash)
    end

    private
    def self.save_player_public(player)
      player_hash = player_hash(player)
      
      # enemy cannot read cards data
      player_hash["cards"] = nil 

      public_file = MY_DIR.join("public.txt") 
      public_file.write(JSON.dump(player_hash))
      public_file.chmod(0644)
    end

    def self.save_player_private(player)
      player_hash = player_hash(player)
      
      private_file = MY_DIR.join("private.txt") 
      private_file.write(JSON.dump(player_hash["cards"]))
      private_file.chmod(0600)
    end

    def self.player_hash(player_obj)
      hash = {}
      hash["name"] = player_obj.name
      hash["money"] = player_obj.money
      hash["jobs"] = player_obj.jobs
      hash["cards"] = player_obj.cards
      hash
    end

    def self.player_obj(player_hash)
      Model::Player.new(
                player_hash["name"], 
                player_hash["money"], 
                player_hash["jobs"], 
                player_hash["cards"])
    end

    def self.me?(player_name)
      player_name == Etc.getlogin
    end
  end
end
