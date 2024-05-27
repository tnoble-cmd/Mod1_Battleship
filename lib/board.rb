require 'cell'

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

    def valid_placement?(ship, coordinates)
        
        def key_to_position(key)
            row = key[0].ord - 'A'.ord
            col = key[1..-1].to_i - 1
            [row, col]
        end
        
        hash_keys = @cells.keys
        # indices = coordinates.map { |key| hash_keys.index(key) }
        positions = coordinates.map { |key| key_to_position(key) }

        positions.sort!

        # Should make sure the number of coordinates in the array is the same
        # as the length of the ship
        if (ship.length == coordinates.length)

            # Should make the sure the coordinates are consecutive across rows / columns
            if (positions.each_cons(2).all? { |(r1, c1), (r2, c2) | r2 == r1 + 1 && c1 = c2 })
                return true
            end

            return false
        end

        return false
    end
end

# binding.pry