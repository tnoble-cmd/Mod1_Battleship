class Cell    
    attr_reader :coordinate, :ship, :fired_upon

    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
        @fired_upon = false
    end

    def empty?
        if (@ship == nil)
            return true
        end

        return false
    end

    def place_ship(ship)
        @ship = ship
    end

    def fired_upon?
        return @fired_upon
    end

    def fire_upon
        @fired_upon = true
        
        if @ship
            @ship.health -= 1
        end
    end

    def render(reveal=false)
        if (reveal && @ship)
            return "S"
        elsif (@fired_upon == true && !@ship)
            return "M"
        elsif (@fired_upon == true && @ship.health != 0)
            return "H"
        elsif (@fired_upon == true && @ship.health == 0)
            return "X"
        else
            return "."
        end
    end
end 