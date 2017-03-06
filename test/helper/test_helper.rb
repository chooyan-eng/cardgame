require 'model/player'
require 'model/field'
require 'pathname'
require 'etc'

DATA_DIR = Pathname.pwd.join("data")
MY_DIR = DATA_DIR.join("#{Etc.getlogin}")

def new_player_data
  Model::Player.new(Etc.getlogin, 300, [1], [1, 3, 5])
end

def new_field_data
  Model::Field.new(
    [Model::Player.new("player1", 300, [], []), Model::Player.new("player2", 200, [], [])],
    [[1, 2, 3], [4, 5], [6, 6, 7, 7]])
end
