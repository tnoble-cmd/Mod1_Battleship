class Cell    
    attr_reader :coordinate, :ship

    def initialize(coordinate)
        @coordinate = coordinate
        @ship = nil
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
end