require_relative 'game'
require_relative 'card'
require_relative 'view'

def play
game = Game.new()
view = View.new()
game.load_cards('flashcard_samples2.txt')
game.create_cards

  if view.start_game == "yes"
    round = 1
    while game.results.has_key?(false) == true
      puts "-------------------------"
      puts "Round #{round}"
      puts "-------------------------"
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
        p game.results
        view.show_results(game.results)
        game.reset_deck
        round += 1
      end
    end
    return view.thanks
  end
end

  if ARGV[0] == "begin"
    play
  elsif ARGV[0] == "cards"
    game = Game.new()
    view = View.new()
    game.load_cards(ARGV[1])
    game.create_cards
    puts game.show_deck
  end
