require_relative 'game'
require_relative 'card'
require_relative 'view'



def play

  game = Game.new()
  view = View.new()
  game.load_cards('flashcard_samples2.txt')
  game.create_cards

  if view.start_game == "yes"
    number = 1
    while game.results.has_key?(false) == true
      view.round(number)
      game.deck.each_with_index do |card, index|
        view.show_question(game.ask_question(index))
        view.response(game.correct?(view.get_answer, index))
        view.show_answer(card)
      end
      game.count_results
      if game.results.has_key?(false) == false
        if view.end_game == "yes"
          view.continue
          play
        end
      else
        view.show_results(game.results)
        game.reset_deck
        number += 1
      end
    end
    view.thanks
  end
end


  if ARGV[0] == "begin"
    play
  elsif ARGV[0] == "cards"
    game = Game.new()
    view = View.new()
    game.load_cards('flashcard_samples2.txt')
    game.create_cards
    view.all_cards(game.deck)
  end