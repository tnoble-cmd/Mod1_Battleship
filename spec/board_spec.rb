require 'spec_helper'

RSpec.describe Board do
    before(:each) do
        @board = Board.new()
    end

    describe '#initialize' do
        it 'can initialize' do
            expect(@board).to be_an_instance_of(Board)
            expect(@board.cells).to be_an_instance_of(Hash)
        end
    end
end