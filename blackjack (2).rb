# PSEUDO CODE
# 52 cards in a deck
# player and dealer
# dealer gets 2 cards
# player gets 2 cards
#   number cards are numeric value
#   face cards are 10
#   ace is either 1 or 11
# cards must add up as close to 21 as possible without going over
# player chooses hit or stay
# repeat until bust or satisfied
# over 21 is bust
# equal to 21 wins
# dealer must hit unless over 17
#   if dealer busts, player wins
#   if dealer hits 21, dealer wins
#   if dealer stays, dealer and player hands are compared

#require 'pry'

def initialize_deck
  deck = [['2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace'],[' of Hearts', ' of Diamonds', ' of Spades', ' of Clubs']]
end

def player_hand(deck)
  hand = 2.times do 
    puts deck[0].sample + deck[1].sample
  end
#remove dealt cards from deck array
  hand.delete_if
end

def computer_hand
  2.times do 
    puts deck[0].sample + deck[1].sample
  end
end

deck = initialize_deck

puts "Hey there hotshot, what's your name?"
name = gets.chomp

begin
puts "Good to meet you #{name}, here are your two cards:"
player_hand(deck)

end


