require 'etc'
require 'pathname'
require 'fileutils'
require 'json'
require 'model/player'

module Util
  class DataIo
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

    def self.save_field(field)
      field_hash = field_hash(field)
      DATA_DIR.join("field.txt").write(JSON.dump(field_hash))
    end
    
    def self.load_field()
      field_hash = JSON.parse(DATA_DIR.join("field.txt").read)
      field_obj(field_hash)
    end

    def self.delete_all_data
      DATA_DIR.children.each{ |child| FileUtils.rm_rf(child) }
    end

    def self.player_dirs
      DATA_DIR.children.find { |child| child.directory? }
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

    def self.field_hash(field_obj)
      hash = {}
      hash["cards"] = field_obj.cards
      hash["current_player"] = field_obj.current_player
      hash
    end

    def self.field_obj(field_hash)
      Model::Field.new(
                [],
                field_hash["cards"], 
                field_hash["current_player"])
    end
  end
end
