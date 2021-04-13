require_relative "spec_helper"

module Tictactoe
  RSpec.describe Board do
    context "#initialize" do
      it "initializes a board with a grid" do
        expect { Board.new(grid: "grid") }.to_not raise_error
      end

      it "sets the grid with 3 rows by default" do
        board = Board.new
        expect(board.grid.count).to be == 3
      end

      it "creates 3 things in each row by default" do
        board = Board.new
        board.grid.each do |row|
          expect(row.count).to be == 3
        end
      end
    end

    context "#grid" do
      it "returns the grid" do
        board = Board.new(grid: "blah")
        expect(board.grid).to eq("blah")
      end
    end

    context "#get_cell" do
      it "returns the cell based on the (x,y) coordinates" do
        grid = [["", "", ""], ["", "", "something"], ["", "", ""]]
        board = Board.new(grid: grid)
        expect(board.get_cell(2, 1)).to eq("something")
      end
    end

    context "#set_cell" do
      it "updates the value of the cell at (x,y)" do
        Cat = Struct.new(:value)
        grid = [[Cat.new("woof"), "", ""], ["", "", ""], ["", "", ""]]
        board = Board.new(grid: grid)
        board.set_cell(0, 0, "meow")
        expect(board.get_cell(0, 0).value).to eq "meow"
      end
    end

    # this is just some code to use in the testing for game_over
    # not sure if it'll work, but I'm pretty sure I have it scoped correctly
    # so these are faking the `Cell` class object

    TestCell = Struct.new(:value)
    let(:x_cell) { TestCell.new("X") }
    let(:y_cell) { TestCell.new("Y") }
    let(:empty) { TestCell.new }

    context "#draw?" do
      it "returns true if no empty spaces" do
        grid = [
          [x_cell, x_cell, y_cell],
          [y_cell, y_cell, x_cell],
          [x_cell, y_cell, x_cell]
        ]
        board = Board.new(grid: grid)
        expect(board.draw?).to be true
      end

      it "returns false if there is an empty space" do
        grid = [
          [empty, x_cell, y_cell],
          [y_cell, y_cell, x_cell],
          [x_cell, y_cell, x_cell]
        ]
        board = Board.new(grid: grid)
        expect(board.draw?).to be false
      end

    end

    context "#game_over" do
      it "returns :winner if winner? is true" do
        board = Board.new
        allow(board).to receive(:winner?) { true }
        expect(board.game_over).to eq :winner
      end

      it "returns :draw if winner? is false and draw? is true" do
        board = Board.new
        allow(board).to receive(:winner?) { false }
        allow(board).to receive(:draw?) { true }
        expect(board.game_over).to eq :draw
      end

      it "returns false if winner? is false and draw? is false" do
        board = Board.new
        allow(board).to receive(:winner?) { false }
        allow(board).to receive(:draw?) { false }
        expect(board.game_over).to eq false
      end

      it "returns :winner when row has objects with values that are all the same" do
        grid = [
          [x_cell, x_cell, x_cell],
          [x_cell, y_cell, x_cell],
          [x_cell, x_cell, empty]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end

      it "returns :winner when the column has objects with the same value" do
        grid = [
          [x_cell, empty, empty],
          [x_cell, y_cell, empty],
          [x_cell, empty, y_cell]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end

      it "returns :winner when the diagonals have objects with the same value" do
        grid = [
          [x_cell, y_cell, x_cell],
          [y_cell, x_cell, empty],
          [empty, x_cell, x_cell]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :winner
      end

      it "returns :draw when no emptys and no winner" do
        grid = [
          [x_cell, y_cell, y_cell],
          [y_cell, x_cell, x_cell],
          [x_cell, y_cell, y_cell]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to eq :draw
      end

      it "returns false when no winner and no draw" do
        grid = [
          [empty, empty, empty],
          [empty, empty, empty],
          [empty, empty, empty]
        ]
        board = Board.new(grid: grid)
        expect(board.game_over).to be false
      end
    end
  end
end
