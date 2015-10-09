require_relative 'game'
require_relative 'card'
require_relative 'view'

game = Game.new()
view = View.new()
game.load_cards('flashcard_samples.txt')
game.create_cards

if view.start_game == "yes"
  game.deck.each_with_index do |card, index|
    view.show_question(game.ask_question(index))
    view.response(game.correct?(view.get_answer, index))
    view.show_answer(card)
  end

end
