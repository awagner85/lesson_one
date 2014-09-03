#1. Come up with requirements/specifications, which will determine the scope
#2. Application logic; sequence of steps
#3. Translation of those steps into code
#4. Run code to verify logic

#draw a board

#assign player1 to "x"
#assign player 2 to "o"

#loop until a winner or all squares are taken
#  player1 picks an empty square
#  check for winner
#  player2 picks an empty square
#  check for winner

#if theres a winner
#  show the winner
#or else
#  it's a tie

#board = {1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' '}

puts "Let's play tic-tac-toe!"

def initialize_board
  board = {}
  (1..9).each { |position| board[position] = ' ' }
  board
end

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

def empty_positions(board)
  board.select { |k, v| v == ' ' }.keys
end

def player_picks_square(board)
  begin
    puts "Choose a position (from 1-9) to place your piece:"
    position = gets.chomp.to_i
  end until empty_positions(board).include?(position)
  board[position] = 'X'
end

def computer_picks_square(board)
  position = empty_positions(board).sample
  board[position] = 'O'  
end

def full_board?(board)
  empty_positions(board) == []
end

def check_winner(board)
  winning_lines = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  winning_lines.each do |line|
    return 'Player' if board.values_at(*line).count('X') == 3
    return 'Computer' if board.values_at(*line).count('O') == 3
  end
  nil
end

board = initialize_board
draw_board(board)

begin
  player_picks_square(board)
  computer_picks_square(board)
  draw_board(board)
  winner = check_winner(board)
end until winner || full_board?(board)

if winner
  puts "#{winner} won!"
else
  puts "It's a tie!"
end
