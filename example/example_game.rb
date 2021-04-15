require_relative '../lib/tictactoe'

puts 'Welcome to tic tac toe'
bob = Tictactoe::Player.new({ color: 'X', name: 'bob' })
frank = Tictactoe::Player.new({ color: 'O', name: 'frank' })
players = [bob, frank]
Tictactoe::Game.new(players).play
