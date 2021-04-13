#purpose of Game class is to manage the moves and turns of the players; All the code before has been very static...in that it's not connected to each other and it doesn't have a start or a finish. The Game class is much more of an "engine", in that it will start the game, and it will have a middle portion of game play, and it will end the game. The Game class will achieve all those things by using the code previously written, and writing some more code

module Tictactoe
  class Game
    attr_reader :players, :board, :current_player, :other_player

    def initialize(players, board = Board.new)
        @players = players
        @board = board
        @current_player, @other_player = players.shuffle
    end

    def switch_players
        @current_player, @other_player = @other_player, @current_player
    end

    def solicit_move
        "#{current_player.name}: Enter a number between 1 and 9 to make your move"
    end

  end
end
