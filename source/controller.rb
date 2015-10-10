require_relative 'game'
require_relative 'card'
require_relative 'view'

game = Game.new()
view = View.new()
game.load_cards('flashcard_samples2.txt')
game.create_cards

  if view.start_game == "yes"
    round = 1
    while game.count_results.has_key?(false) == true
      puts "-------------------------"
      puts "Round #{round}"
      puts "-------------------------"
      game.deck.each_with_index do |card, index|
        view.show_question(game.ask_question(index))
        view.response(game.correct?(view.get_answer, index))
        view.show_answer(card)
      end
      if game.count_results.has_key?(false) == false
        if view.end_game == "yes"
          puts "Too bad!"
        else
          puts "Thanks for playing!"
        end
      else
        view.show_results(game.count_results)
        game.reset_deck
        round += 1
      end
    end

  end
