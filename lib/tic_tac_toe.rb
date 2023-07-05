class TicTacToe
    #create a new instance of TicTacToe class, sets the instance variable @board to anew array with 9 empty string
    def initialize
      @board = Array.new(9, " ")
    end
    #board cells are accessed using their corresponding indices from the @board array.
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
      end
      #takes a user input as a string and converts it to an integer using the to_i, subtract 1 from the input since the index in the @board array starts from 0 and the spaces are numbered from 1 to 9
       def input_to_index(input)
        input.to_i - 1
       end
       #the method takes in two arguements 'index' and 'token', the token argument is set to adefault value of "X"
       def move(index, token="X")
        @board[index] = token
       end
       #takes an index argument representing the position on the board to be checked
       # checks if the value at that index in the @board array is not equal to an empty string (" "). If it is not empty, it means the position is already occupied,
       def position_taken?(index)
        @board[index] != " "
      end
      #takes a position argument representing the position to be checked on the game board
      #converts the position to and index using 'input_to_index', checks if the index is btn 0 & 8, also checks if the position is not already taken using 'position_taken?'
      def valid_move?(position)
        index = input_to_index(position)
        index.between?(0, 8) && !position_taken?(index)
      end
       #@board.count checks how many elements in the array are equal to "X" or "O"
       def turn_count
        @board.count { |cell| cell == "X" || cell == "O" }
       end
       #If the number of turns is even, it returns "X" indicating that it's "X"'s turn. Otherwise, it returns "O" indicating that it's "O"'s turn.
       def current_player
        turn_count.even? ? "X" : "O"
       end
       #uses the all? to iterate over each element in the @board array and checks if each position contains either "X" or "O"
       def full?
        @board.all? { |position| position == "X" || position == "O" }
       end
       #checks if the board has not been won (!won?) and is full (full?). If both conditions are true, it returns true, indicating a draw. Otherwise, it returns false
      def draw?
        !won? && full?
      end
      #checks if the board has been won (won?) or is a draw (draw?). If either condition is true, it returns true, indicating the game is over. Otherwise, it returns false
      def over?
        won? || draw?
      end
  end


  