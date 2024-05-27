class Game

    def initialize
        @players = []
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

    def computer_ship_placement
        #computer instance
        @computer_board = Board.new
        @computer_cruiser = Ship.new("Cruiser", 3)
        @computer_submarine = Ship.new("Submarine", 2)
        #computer ship placement
        @computer_board.place(@computer_cruiser, ["A4", "B4", "C4"])
        @computer_board.place(@computer_submarine, ["C1", "D1"])
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
            cruiser_input = gets.chomp.split(" ")
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
            submarine_input = gets.chomp.split(" ")
            if @player_board.valid_placement?(@player_submarine, submarine_input)
                @player_board.place(@player_submarine, submarine_input)
                break
            else
                puts "Invalid input. Please try again."
            end
        end
        
        puts @player_board.render(true)
    end
end