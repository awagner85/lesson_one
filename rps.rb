comp_choice = rand(1..3)

puts "\n~~*~~*~~Let's play Rock, Paper, Scissors!~~*~~*~~\n"

loop do
 
	puts "\nChoose your weapon: rock, paper, or scissors.\n"
  weapon = gets.chomp

  if (weapon == "rock") && (comp_choice == 1)
	  puts "\nYou chose rock. The computer chose rock. \nIt's a tie!"
	elsif (weapon == "rock") && (comp_choice == 2)
	  puts "\nYou chose rock. The computer chose paper. \nYou lose!"
	elsif (weapon == "rock") && (comp_choice == 3)
	  puts "\nYou chose rock. The computer chose scissors. \nGreat success!"
		
  elsif (weapon == "paper") && (comp_choice == 1)
	  puts "\nYou chose paper. The computer chose rock. \nGreat success!"
  elsif (weapon == "paper") && (comp_choice == 2)
	  puts "\nYou chose paper. The computer chose paper. \nIt's a tie!"
  elsif (weapon == "paper") && (comp_choice == 3)
	  puts "\nYou chose paper. The computer chose scissors. \n You lose!"
	  
	elsif (weapon == "scissors") && (comp_choice == 1)
	  puts "\nYou chose scissors. The computer chose rock. \nYou lose!"
	elsif (weapon == "scissors") && (comp_choice == 2)
	  puts "\nYou chose scissors. The computer chose paper. \n reat success!"
	elsif (weapon == "scissors") && (comp_choice == 3)
	  puts "\nYou chose scissors. The computer chose scissors. \nIt's a tie!"
  else
	  puts "\nDo you not know the rules?"
	end
	
	puts "\nWould you like to play again? (y/n)\n"
	response = gets.chomp
	
	if response == "y"
	  redo
	else 
		puts "Good bye!"
		break
	end
end


		