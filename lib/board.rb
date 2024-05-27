require './lib/cell'

class Board
    def initialize
        @cells = {
            "A1" => Cell.new("A1"),
            "A2" => Cell.new("A2"),
            "A3" => Cell.new("A3"),
            "A4" => Cell.new("A4"),
            "B1" => Cell.new("B1"),
            "B2" => Cell.new("B2"),
            "B3" => Cell.new("B3"),
            "B4" => Cell.new("B4"),
            "C1" => Cell.new("C1"),
            "C2" => Cell.new("C2"),
            "C3" => Cell.new("C3"),
            "C4" => Cell.new("C4"),
            "D1" => Cell.new("D1"),
            "D2" => Cell.new("D2"),
            "D3" => Cell.new("D3"),
            "D4" => Cell.new("D4"),
        }
    end    

    def cells
        return @cells
    end

    def valid_coordinate?(cell)
        @cells.has_key?(cell)
    end

    def place(ship, coordinates)
        if valid_placement?(ship, coordinates)
            coordinates.each do |coordinate|
                @cells[coordinate].place_ship(ship)
            end
        end
    end

    def valid_placement?(ship, coordinates)

        if ship.length != coordinates.length
            return false
        end
        
        coordinates.each do |coordinate|
            if !@cells.has_key?(coordinate) || !@cells[coordinate].empty?()
                return false
            end        
        end
        
        row = coordinates[0][0]
        col = coordinates[0][1].to_i

        vertical = true

        coordinates[1..].each do |coordinate|
            if coordinate[0] != row || col + 1 != coordinate[1].to_i
                vertical = false
                break
            end
            col = col + 1
        end

        row = coordinates[0][0]
        col = coordinates[0][1].to_i
        horizontal = true

        coordinates[1..].each do |coordinate|
            if coordinate[0].ord != row.ord + 1 || col != coordinate[1].to_i
                horizontal = false
                break
            end
            row = coordinate[0]
        end

        return horizontal || vertical
    end


    def render(hidden=false)
        "  1 2 3 4 \n" +
        "A #{@cells['A1'].render(hidden)} #{@cells['A2'].render(hidden)} #{@cells['A3'].render(hidden)} #{@cells['A4'].render(hidden)} \n" +
        "B #{@cells['B1'].render(hidden)} #{@cells['B2'].render(hidden)} #{@cells['B3'].render(hidden)} #{@cells['B4'].render(hidden)} \n" +
        "C #{@cells['C1'].render(hidden)} #{@cells['C2'].render(hidden)} #{@cells['C3'].render(hidden)} #{@cells['C4'].render(hidden)} \n" +
        "D #{@cells['D1'].render(hidden)} #{@cells['D2'].render(hidden)} #{@cells['D3'].render(hidden)} #{@cells['D4'].render(hidden)} \n"
    end

    
end

# binding.pry