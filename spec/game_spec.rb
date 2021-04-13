require_relative "spec_helper"

module Tictactoe
    RSpec.describe Game do

        let(:bob) { Player.new({ color: "X", name: "bob"}) }
        let(:frank) { Player.new({ color: "O", name: "frank"}) }


        context "#initialize" do
            it "randomly selects a current_player" do
                
            end
        end
    end
end