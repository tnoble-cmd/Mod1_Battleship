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
        if @fired_upon
          if @ship
            if @ship.health.zero?
                "X"
            else
                "H"
            end
          else
            "M"
          end
        elsif reveal && @ship
            "S"
        else
            "."
        end
    end

end 