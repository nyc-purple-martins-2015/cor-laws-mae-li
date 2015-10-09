require_relative 'game'
require_relative 'card'
require_relative 'view'

game = Game.new()
view = View.new()
game.load_cards('flashcard_samples2.txt')
game.create_cards

  if view.start_game == "yes"
    game.deck.each_with_index do |card, index|
      view.show_question(game.ask_question(index))
      view.response(game.correct?(view.get_answer, index))
      view.show_answer(card)
    end
    view.show_results(game.count_results)
    game.reset_deck
    x = 2
    until game.results[0] == "done"
    puts "-------------------------"
    puts "Round #{x}"
    puts "-------------------------"
      game.results[false].each_with_index do |card, index|
        view.show_question(game.ask_question(index))
        view.response(game.correct?(view.get_answer, index))
        view.show_answer(card)
        end
      view.show_results(game.count_results)
      game.reset_deck
      x += 1
    end
    if view.end_game == "yes"
      "Too bad!"
    else return "Thanks for playing!"
    end
end

game
