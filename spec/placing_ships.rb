require './lib/board'
# => true

require './lib/ship'
# => true

board = Board.new
# => #<Board:0x00007fcb0d9db478...>

cruiser = Ship.new("Cruiser", 3)
# => #<Ship:0x00007fcb0d989510...>

submarine = Ship.new("Submarine", 2)    
# => #<Ship:0x00007fcb0e8402c0...>

board.valid_placement?(cruiser, ["A1", "A2"])
# => false

board.valid_placement?(submarine, ["A2", "A3", "A4"])
# => false

board.valid_placement?(cruiser, ["A1", "A2", "A4"])
# => false

board.valid_placement?(submarine, ["A1", "C1"])
# => false

board.valid_placement?(cruiser, ["A3", "A2", "A1"])
# => false

board.valid_placement?(submarine, ["C1", "B1"])
# => false

board.valid_placement?(cruiser, ["A1", "B2", "C3"])
# => false

board.valid_placement?(submarine, ["C2", "D3"])
# => false


board.valid_placement?(submarine, ["A1", "A2"])
# => true

board.valid_placement?(cruiser, ["B1", "C1", "D1"])
# => true

require './lib/board'
# => true

require './lib/ship'
# => true

board = Board.new
# => #<Board:0x00007fcb0e1f6720...>

cruiser = Ship.new("Cruiser", 3)    
# => #<Ship:0x00007fcb0e1ffa28...>

board.place(cruiser, ["A1", "A2", "A3"])    

cell_1 = board.cells["A1"]    
# => #<Cell:0x00007fcb0e1f66a8...>

cell_2 = board.cells["A2"]
# => #<Cell:0x00007fcb0e1f6630...>

cell_3 = board.cells["A3"]    
# => #<Cell:0x00007fcb0e1f65b8...>

cell_1.ship
# => #<Ship:0x00007fcb0e1ffa28...>

cell_2.ship
# => #<Ship:0x00007fcb0e1ffa28...>

cell_3.ship
# => #<Ship:0x00007fcb0e1ffa28...>

cell_3.ship == cell_2.ship


require './lib/board'
# => true

require './lib/ship'
# => true

board = Board.new
# => #<Board:0x00007fcb0e1f6720...>

cruiser = Ship.new("Cruiser", 3)
# => #<Ship:0x00007fcb0d92b5f0...>

board.place(cruiser, ["A1", "A2", "A3"])

submarine = Ship.new("Submarine", 2)    
# => #<Ship:0x00007fcb0dace9c0...>

board.valid_placement?(submarine, ["A1", "B1"])


require './lib/board'
# => true

require './lib/ship'
# => true

board = Board.new
# => #<Board:0x00007fcb0e1f6720...>

cruiser = Ship.new("Cruiser", 3)
# => #<Ship:0x00007fcb0d92b5f0...>

board.place(cruiser, ["A1", "A2", "A3"])

board.valid_placement?(cruiser, ["A1", "A2", "A3"])

submarine = Ship.new("Submarine", 2)    
# => #<Ship:0x00007fcb0dace9c0...>

board.valid_placement?(submarine, ["A1", "B1"])



require './lib/board'
# => true

require './lib/ship'
# => true

board = Board.new
# => #<Board:0x00007fcb0f056860...>

cruiser = Ship.new("Cruiser", 3)    
# => #<Ship:0x00007fcb0f0573f0...>

board.place(cruiser, ["A1", "A2", "A3"])    

board.render
# => "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"

board.render(true)
# => "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n"