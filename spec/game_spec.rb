require_relative "spec_helper"

module Tictactoe
  RSpec.describe Game do
    let(:bob) { Player.new({ color: "X", name: "bob" }) }
    let(:frank) { Player.new({ color: "O", name: "frank" }) }
    let(:mike) { Player.new({ color: "Y", name: "mike" }) }

    context "#initialize" do
      it "randomly selects a current player" do
        # Array.any_instance.stub(:shuffle) { [frank, bob] }
        allow_any_instance_of(Array).to receive(:shuffle).and_return([bob, frank])
        game = Game.new([frank, bob])
        expect(game.current_player).to eq bob
      end

      it "randomly selects an other player" do
        allow_any_instance_of(Array).to receive(:shuffle).and_return([bob, frank])
        game = Game.new([bob, frank])
        expect(game.other_player).to eq frank
      end
    end

    context "#switch_players" do
      it "will set @current_player to @other_player" do
        game = Game.new([bob, frank])
        other_player = game.other_player
        game.switch_players
        expect(game.current_player).to eq other_player
      end

      it "will set @other_player to @current_player" do
        game = Game.new([bob, frank])
        current_player = game.current_player
        game.switch_players
        expect(game.other_player).to eq current_player
      end
    end

    context "#solicit_move" do
        it "asks the player to make a move" do
            game = Game.new([bob, frank])
            allow(:current_player) { bob }
            expected = "bob: Enter a number between 1 and 9 to make your move"
            expect(game.solicit_move).to eq expected
        end
    end
  end
end
