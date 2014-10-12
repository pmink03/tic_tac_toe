# a simple tic tac toe game in Ruby

# the game board
board = {}

#intialize the board
def init_board(b)
	(1..9).each { |loc| b[loc] = ' ' }
end

# draw game board
def draw_board(b)
	system 'cls'
	puts "     |     |     "
	puts "  #{b[1]}  |  #{b[2]}  |  #{b[3]}  "
	puts "     |     |     "
	puts "-----+-----+-----"
	puts "     |     |     "
	puts "  #{b[4]}  |  #{b[5]}  |  #{b[6]}  "
	puts "     |     |     "
	puts "-----+-----+-----"
	puts "     |     |     "
	puts "  #{b[7]}  |  #{b[8]}  |  #{b[9]}  "
	puts "     |     |     "
end

# return an array of the keys for the empty locations on the game board
def empty_locations(b)
	b.select { |k,v| v == ' ' }.keys
end

# brute force check for winning conditions on the game board
# assumes that the player uses 'X' and the computer uses 'O'
def check_for_winner(b)
	win_locs = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9],[1,5,9],[3,5,7]]
	win_locs.each do |loc|
		if b[loc[0]] == 'X' && b[loc[1]] == 'X' && b[loc[2]] == 'X'
			return "Player"
		end
		if b[loc[0]] == 'O' && b[loc[1]] == 'O' && b[loc[2]] == 'O'
			return "Computer"
		end 
	end
	return nil
end

# gets the location for the player's move
def player_move(b)
	done = false
	begin
		puts "Choose a position (from 1 to 9)"
		user_move = gets.chomp.to_i
		if empty_locations(b).include?(user_move)
			b[user_move] = 'X'
			done = true
		else
			puts "Location #{user_move} already taken."
		end
	end until done
end

# generates a random location for the computer's move
def computer_move(b)
	loc = empty_locations(b).sample 
	b[loc] = 'O'
	puts "Computer selects square #{loc}"
end


init_board(board)
draw_board(board)

# main game loop
begin
	if !empty_locations(board).empty?
		player_move(board)
		draw_board(board)
		if check_for_winner(board) == 'Player'
			puts "Player wins!"
			break
		end	
	end
	if !empty_locations(board).empty?
		computer_move(board)
		draw_board(board)
		if check_for_winner(board) == 'Computer'
			puts "Computer wins!"
			break
		end	
	end
end until empty_locations(board).empty?

puts "Thank you for playing!"
