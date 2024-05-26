require 'spec_helper'

RSpec.describe Board do
    before(:each) do
        @board = Board.new()
        @cruiser = Ship.new("Cruiser", 3)
        @submarine = Ship.new("Submarine", 2)
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
            expect(@board.valid_coordinate?("A1")).to be(true)
            expect(@board.valid_coordinate?("D4")).to be(true)
            expect(@board.valid_coordinate?("A5")).to be(false)
            expect(@board.valid_coordinate?("E1")).to be(false)
            expect(@board.valid_coordinate?("A22")).to be(false)
        end
    end

    describe '#valid_placement?' do
        it 'can make sure the number of coordinates in the array is the same as the length of the ship' do
            expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
            expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
        end
        it 'can make sure the coordinates are consecutive' do
            expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
            expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to eq(false)
            expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to eq(false)
            expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to eq(false)
        end
        it 'can make sure the coordinates are not diagonal' do
            expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to eq(false)
            expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to eq(false)
        end
        it 'can make sure that coordinate placements are valid' do
            expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to eq(true)
            expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to eq(true)
        end
    end
end