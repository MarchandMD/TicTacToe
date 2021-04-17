require_relative 'spec_helper'

module Tictactoe
  RSpec.describe Player do
    context '#initialize' do
      it 'raises an exception when initiliazed with {}' do
        expect { Player.new({}) }.to raise_error(KeyError)
      end

      it 'does not raise an error when initialized with a valid hash' do
        input = { color: 'X', name: 'Someone' }
        expect { Player.new(input) }.to_not raise_error
      end

      it 'correctly assigns a color to a player' do
        input = { color: 'X', name: 'Someone' }
        player1 = Player.new(input)
        expect(player1.color).to eq 'X'
      end
    end
  end
end
