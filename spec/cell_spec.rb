require 'spec_helper'

RSpec.describe Cell do
    before(:each) do
        @cell = Cell.new("B4")
        @cruiser = Ship.new("Cruiser", 3)
    end

    describe '#initialize' do
        it 'can initialize' do
            expect(@cell).to be_an_instance_of(Cell)
            expect(@cell.coordinate).to eq('B4')
            expect(@cell.ship).to eq(nil)
            expect(@cell.empty?).to eq(true)
        end
    end

    describe '#empty?' do
        it 'returns whether a cell is empty or not' do
            expect(@cell.empty?).to eq(true)
        end
    end

    describe '#place_ship' do
        it 'places a given shape inside the cell' do
            @cell.place_ship(@cruiser)
            expect(@cell.ship).to eq(@cruiser)
            expect(@cell.empty?).to eq(false)
        end
    end

    describe '#fired_upon?' do 
        @cell.place_ship(@cruiser)
        expect(@cell.fired_upon?).to eq(false)
        @cell.fire_upon()
        expect(@cell.ship.health).to eq(2)
        expect(@cell.fired_upon?).to eq(true)
    end
end
