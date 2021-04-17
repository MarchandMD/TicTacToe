# purpose of Game class is to manage the moves and turns of the players; All the code before has been very static...in that it's not connected to each other and it doesn't have a start or a finish. The Game class is much more of an "engine", in that it will start the game, and it will have a middle portion of game play, and it will end the game. The Game class will achieve all those things by using the code previously written, and writing some more code

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

    def get_move(human_move = gets.chomp)
      human_move_to_coordinate(human_move)
    end

    def valid_move?
      # if move is valid ? set_cell : get_move
    end

    def game_over_message
      return "#{current_player.name} won!" if board.game_over == :winner
      return 'The game ended in a tie' if board.game_over == :draw
    end

    def play
      puts "#{current_player.name} has been randomly selected to go first"
      while true
        board.formatted_grid
        puts ''
        puts solicit_move
        x, y = get_move
        # valid_move?
        board.set_cell(x, y, current_player.color)
        if board.game_over
          puts game_over_message
          board.formatted_grid
          return
        else
          switch_players
        end
      end
    end

    private

    def human_move_to_coordinate(human_move)
      mapping = {
        '1' => [0, 0],
        '2' => [1, 0],
        '3' => [2, 0],
        '4' => [0, 1],
        '5' => [1, 1],
        '6' => [2, 1],
        '7' => [0, 2],
        '8' => [1, 2],
        '9' => [2, 2]
      }
      mapping[human_move]
    end
  end
end
