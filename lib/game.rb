class Game
    attr_reader :player_board, :computer_board, :player_cruiser, :player_submarine, :computer_cruiser, :computer_submarine, :restart, :computer_shots, :computer_ships
    def initialize
        @computer_shots = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
        @computer_ships = []
    end


    def welcome
        #welcome message
        puts "Welcome to BATTLESHIP"
        puts "Enter p to play. Enter q to quit."
        #welcome loop
        loop do
            input = gets.chomp
            if input == "p"
                #if player chooses to play, greeted and computer ship placement starts
                puts "Great! Let's play."
                computer_ship_placement
                break
            elsif input == "q"
                puts "Goodbye!"
                break
            else
                puts "Invalid input. Please try again."
            end
        end
    end

    def computer_random_placement(ship)
        #random placement loop
        loop do
            random_placement = @computer_board.cells.keys.sample(ship.length)
            if @computer_board.valid_placement?(ship, random_placement)
                @computer_board.place(ship, random_placement)
                @computer_ships << random_placement
                break
            end
        end
    end


    def computer_ship_placement
        #computer instance
        @computer_board = Board.new
        @computer_cruiser = Ship.new("Cruiser", 3)
        @computer_submarine = Ship.new("Submarine", 2)
        #computer ship placement
        computer_random_placement(@computer_cruiser)
        computer_random_placement(@computer_submarine)
        #after computer placement, player ship placement starts
        player_ship_placement
    end

    def player_ship_placement
        #set up player instance
        @player_board = Board.new
        @player_cruiser = Ship.new("Cruiser", 3)
        @player_submarine = Ship.new("Submarine", 2)
        #prompt player to place ships
        puts "I have laid out my ships on the grid."
        puts "You now need to lay out your two ships."
        puts "The Cruiser is three units long and the Submarine is two units long."
        puts @player_board.render
        puts "Enter the squares for the Cruiser (3 spaces):"

        #cruiser loop
        loop do
            cruiser_input = gets.upcase.chomp.split(" ")
            if @player_board.valid_placement?(@player_cruiser, cruiser_input)
                @player_board.place(@player_cruiser, cruiser_input)
                break
            else
                puts "Invalid input. Please try again."
            end
        end

        #submarine placement
        puts @player_board.render(true)
        puts "Enter the squares for the Submarine (2 spaces):"
        
        #submarine loop
        loop do
            submarine_input = gets.upcase.chomp.split(" ")
            if @player_board.valid_placement?(@player_submarine, submarine_input)
                @player_board.place(@player_submarine, submarine_input)
                break
            else
                puts "Invalid input. Please try again."
            end
        end
        
        puts @player_board.render(true)
        player_turn
    end

    def player_turn
        #turn loop
        loop do
            puts "=============COMPUTER BOARD============="
            puts @computer_board.render
            puts "==============PLAYER BOARD=============="
            puts @player_board.render(true)
            puts "Enter the coordinate for your shot:"
            player_shot = gets.upcase.chomp
            if !@computer_board.valid_coordinate?(player_shot)
                puts "Invalid input. Please try again."
            elsif @computer_board.cells[player_shot].fired_upon?
                puts "You have already fired on this cell. Please try again."
            else
                @computer_board.cells[player_shot].fire_upon
                puts "Your shot on #{player_shot} was a #{computer_board.cells[player_shot].render}."
            end

            #computer shot
            computer_shot = @computer_shots.sample
            @player_board.cells[computer_shot].fire_upon
            puts "My shot on #{computer_shot} was a #{player_board.cells[computer_shot].render}."
            @computer_shots.delete(computer_shot)
            
            #game over? conditions
            if @computer_cruiser.sunk? && @computer_submarine.sunk?
                puts "You win!"
                welcome
                break
            end
            
            if @player_cruiser.sunk? && @player_submarine.sunk?
                puts "I win!"
                welcome
                break
            end
        end
    end
end