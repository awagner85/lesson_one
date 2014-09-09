#This is my attempt at the game after following the solution video. It's basically the same, I tried to write 
#what I could from memory, and added a loop to repeat the game if wanted.


#require 'pry'
#board = {1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' '}

def draw_board(board)
  system 'cls'
  puts
  puts "     |     |"
  puts "  #{board[1]}  |  #{board[2]}  | #{board[3]} "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[4]}  |  #{board[5]}  | #{board[6]} "
  puts "     |     | "
  puts "-----+-----+-----" 
  puts "     |     |"
  puts "  #{board[7]}  |  #{board[8]}  | #{board[9]} "
  puts "     |     |"
  puts
end

def initialize_board
  board = {}
  (1..9).each { |pos| board[pos] = ' ' }
  board
end

def player_square(board)
  begin
    puts "Choose a square (1-9):"
    pos = gets.chomp.to_i
  end until empty_squares(board).include?(pos)
  board[pos] = 'X'
end 

def computer_square(board)
  pos = empty_squares(board).sample
  board[pos] = 'O'
end

def empty_squares(board)
  board.select { |k,v| v == ' ' }.keys
end

def full_board?(board)
  empty_squares(board) == []
end

def three_in_a_row(board)
  winning_lines = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  winning_lines.each do |line| 
  return 'Player' if board.values_at(*line).count('X') == 3
  return 'Computer' if board.values_at(*line).count('O') == 3
  end
  nil
end

loop do
  board = initialize_board
  draw_board(board)
  begin
    player_square(board)
    computer_square(board)
    draw_board(board)
    winner = three_in_a_row(board)
  end until winner || full_board?(board)

  if three_in_a_row(board)
    puts "#{winner} won!"
  else
    puts "It's a tie!"
  end

  puts "Would you like to play again? (y/n)"
  answer = gets.chomp.downcase

  if answer == "y"
    redo
  else
    puts "So long!"
    break
  end
end


