 module Players
  class Computer < Player
    
<<<<<<< HEAD
    attr_accessor :board, :current_player, :opponent
    
    VALID_MOVES = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
=======
    attr_accessor :board, :current_player
    
    @@valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
>>>>>>> 3176e2a8943160cae4894be92f179e5336015ca4
    
    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
    ]
<<<<<<< HEAD
  
    def move(board) 
      move = strategy(board)
    end

    def strategy(board)
      if winning_decision(board) == current_player 
        attack_move(board)
      elsif winning_decision(board) == opponent_token
        block_move(board)  
      else 
        place_a_token(board)
      end
    end

  def opponent_token
      @opponent = @first_player == "X" ? "X" : "O"
    end

  def winning_decision(board)
    WIN_COMBINATIONS.each_with_index do |combo, index|
      
        a = []
        a << board.cells[combo[0]]
        a << board.cells[combo[1]]
        a << board.cells[combo[2]]
        
        if a.count(opponent_token) == 2
          opponent_token
        elsif a.count(current_player) == 2 
          current_player  
        end
    end    
  end 
  
  def place_a_token(board)
    placing_token = check_available_moves(board)
    placing_token.sample
  end

    def check_available_moves(board)
    
      available_moves = []
      board.cells.each_with_index do |cell,index|
        if cell == " "
        available_moves << index + 1
        end
      end
      available_moves
    end
    
    def attack_move(board) 
      WIN_COMBINATIONS.each_with_index do |combo, index|

        a << board.cells[combo[0]]
        a << board.cells[combo[1]]
        a << board.cells[combo[2]]
        
        if (a.count(current_player) == 2) && (combo[0] == " ")
          combo[0]
        elsif  (a.count(current_player) == 2) && (combo[1] == " ")
          combo[1]
        elsif (a.count(current_player) == 2) && (combo[2] == " ")
          combo[2]
        end
      end
    end 
    
    def block_move(board) 
      WIN_COMBINATIONS.each_with_index do |combo, index|

        a << board.cells[combo[0]]
        a << board.cells[combo[1]]
        a << board.cells[combo[2]]
        
        if (a.count(opponent_token) == 2) && (combo[0] == " ")
          combo[0]
        elsif  (a.count(opponent_token) == 2) && (combo[1] == " ")
          combo[1]
        elsif (a.count(opponent_token) == 2) && (combo[2] == " ")
          combo[2]
        end
      end
    end
  
  end
end
=======
    
    def move(board)
      move = winning_moves(board)
      move.to_i + 1
    end
   
    def opponent_token
      @opponent = @first_player == "X" ? "X" : "O"
    end
    
    def winning_moves(board)
      a = Hash.new
        WIN_COMBINATIONS.each_with_index do |combo, index|
        
        a[combo[0]] = board[combo[0]]
        a[combo[1]] = board[combo[1]]
        a[combo[2]] = board[combo[2]]

          if a.has_value?(opponent_token)
            a.delete_if { |key, value| value == opponent_token }
            return a.keys.sample
          else 
            return a.clear
          end
        end
      return a
    end

  end
end

>>>>>>> 3176e2a8943160cae4894be92f179e5336015ca4
