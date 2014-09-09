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

require 'pry'

def calculate_total(cards)
  #[['2', ' of Hearts'], ['2', ' of Diamonds']...]
  arr = cards.map{ |e| e[0] }

  total = 0
  arr.each do |value|
    if value == "Ace"
      total += 11
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end

  arr.select{ |e| e == "Ace"}.count.times do
    total -= 10 if total > 21
  end
  total
end


deck_cards = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace']
deck_suits = [' of Hearts', ' of Diamonds', ' of Clubs', ' of Spades']

deck = deck_cards.product(deck_suits)
deck.shuffle!

player_hand = []
dealer_hand = []

def hit(hand)
  hand.collect { |i| i.join("") }
end

player_hand << deck.pop
dealer_hand << deck.pop
player_hand << deck.pop
dealer_hand << deck.pop

dealer_total = calculate_total(dealer_hand)
player_total = calculate_total(player_hand)

begin

  puts "Hey there hotshot, looking to play some Blackjack? What's your name?"
  name = gets.chomp
  puts

  puts "Good to meet you #{name}, here are your two cards:"
  puts "#{player_hand[0].join("")}, #{player_hand[1].join("")}, for a total of: #{player_total}."
  puts
 
  puts "Here are my cards:"
  puts "#{dealer_hand[0].join("")}, #{dealer_hand[1].join("")}, for a total of: #{dealer_total}."
  puts

  if player_total == 21
    puts "Blackjack baby! Well played." 
  else
    puts "Would you like to hit or stay?"
    move = gets.chomp.downcase
  end
    
  while move == "hit"
    player_hand << deck.pop
    calculate_total(player_hand)
    puts "Here's your hand now: #{hit(player_hand)}, bringing your total to: #{player_total} "
    if player_total < 21
      puts "Would you like to hit or stay?"
      move = gets.chomp
    else
      puts "Looks like a bust!"
    end
        
  end
  puts "So #{name}, looks like you're at #{player_total}."
  puts
  puts "Let's see what I've got"
  while dealer_total < 17
    dealer_hand << deck.pop
    if dealer_total > 21
      puts "Looks like I've got a bust!"
    elsif dealer_total == 21
      puts "Looks like blackjack for me!"
    else
      puts "Here are my cards: #{dealer_hand}."
    end
  end

  if dealer_total == 21 && player_total < 21
    puts "Sorry about your luck, #{name}!"
  elsif dealer_total == 21 && player_total > 21
    puts "Sorry about your luck, #{name}!"
  elsif dealer_total < 21 && dealer_total > player_total
    puts "Sorry about your luck, #{name}!"

  elsif player_total == 21 && dealer_total < 21
    puts "Great game, #{name}!"
  elsif player_total == 21 && dealer_total > 21
    puts "Great game, #{name}!"
  elsif player_total < 21 && player_total > dealer_total
    puts "Great game, #{name}!"
   
  elsif dealer_total == 21 && player_total == 21
    puts "It would appear we have a tie, #{name}."
  else
    puts "No winners here!"
  end
end


=begin

**NOTES**

line 81: need to find a way to show cards in player_hand neatly as a string rather than 2d array. need to join the individual indices, with a space or comma in between

line 81: new card is not being added into the total, but is being added to array.



=end