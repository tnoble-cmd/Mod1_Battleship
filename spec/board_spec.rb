require 'spec_helper'

RSpec.describe Board do
    before(:each) do
        @board = Board.new()
    end

    describe '#initialize' do
        it 'can initialize' do
            expect(@board).to be_an_instance_of(Board)
            expect(@board.cells).to be_an_instance_of(Hash)
            expect(@board.cells.length).to be(16)
            expect(@board.cells.values[0]).to be_an_instance_of(Cell)
        end
    end

    describe '#valid_coordinate?' do
        it 'can tell us if a coordinate is on the board or not' do
            expect(@board.valid_coordinate?("A1").to be(true))
            expect(@board.valid_coordinate?("D4").to be(true))
            expect(@board.valid_coordinate?("A5").to be(false))
            expect(@board.valid_coordinate?("E1").to be(false))
            expect(@board.valid_coordinate?("A22").to be(false))
        end
    end
end