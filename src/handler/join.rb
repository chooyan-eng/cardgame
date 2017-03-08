require 'etc'
require 'model/player'
require 'util/data_io'

module Handler
  class Join
    def initialize(command_args)
      if !command_args.nil? && command_args.any? then
        @dryrun = command_args[0] != "y" 
        @status = command_args[0] == "st" 
      else
        @dryrun = true
        @status = false
      end
      @result = Handler::Result.new
    end

    def exec
      if @status then
        result_code = game_started? ? "203" : "202"
        @result.push(result_code, joined_players)
        return
      end

      if game_started? then
        @result.push("400", joined_players)
        return
      end

      if @dryrun then
        @result.push("200", joined_players)
      end

      @result.push("201")

      new_player = Model::Player.new(Etc.getlogin)
      Util::DataIo.save_player(new_player)
      if game_started? then
        @result.push("204")
      else
        @result.push("205")
      end
    end

    def result
      @result
    end

    def save
    end

    private
    def joined_players
      Util::DataIo.player_dirs
    end

    def game_started?
      return 0 if joined_players.nil?
      joined_players.size >= 2
    end
  end
end
