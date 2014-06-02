# tick tac toe game

require 'pry'

def initialize_board
	b = {}
	(1..9).each {|position| b[position] = ' '}
	b
end

board = initialize_board

def draw_board(b)
	system 'clear'
 	puts 	"#{b[1]} |#{b[2]} |#{b[3]}	"
 	puts 	"--+--+--"
 	puts 	"#{b[4]} |#{b[5]} |#{b[6]}	"
 	puts 	"--+--+--"
 	puts 	"#{b[7]} |#{b[8]} |#{b[9]}	"
end

def empty_boxes(b)
	x = b.select {|k, v| k if v == ' '} 
	return x.keys 
end

def players_turn(board)
	puts "Please enter a value between #{empty_boxes(board)}"
	y = gets.chomp.to_i
	board[y] = "X"
end

def compters_turn(board)
	m = empty_boxes(board)
	n = m[rand(m.length)]
	board[n] = "O"
end

def decide_winner(board)
	winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

	winning_lines.each do |line|
		line.each do |a|
			if board.all[a] == 'X' 
				puts "Player is the winner"
				exit 			
			elsif board.all[a] == "O"
				puts "Computer is the winner"
				exit	
			else
				nil
			end
		end
	end
end


# 			if b[line[0]] == "X" and b[line[1]] == "X" and b[line[2]] == "X"
# 				puts "Player is the winner"
# 				exit 
# 			elsif b[line[0]] == "O" and b[line[1]] == "O" and b[line[2]] == "O"
# 				puts "Computer is the winner"
# 				exit
# 			else
# 				return nil
# 			end
# 	end
# end

draw_board(board)

while empty_boxes(board).length != 0 do
	players_turn(board)
	draw_board(board)
	decide_winner(board)
	compters_turn(board)
	draw_board(board)
	decide_winner(board)
end

puts "It's a draw"

exit