require_relative 'game'
require_relative 'card'

game = Game.new()
game.load_cards('flashcard_samples.txt')
game.create_cards
puts game.start_game
puts game.show_deck

# card_hash = {
#   question: "How many?",
#   answer: "Too many."
# }

# card = Card.new(card_hash)

# # puts card.question
# puts card.show_card


