class View

  def initialize
  end

  def start_game
    puts "Are you ready to play?"
    answer = STDIN.gets.chomp
  end

  def end_game
    puts "Do you want to try again with the whole deck?"
    answer = STDIN.gets.chomp
  end

  def get_answer
    answer = STDIN.gets.chomp
  end

  def response(arg)
    if arg == true
      puts "Correct"
    else
      puts "Incorrect"
    end
  end

  def round(number)
    puts "-------------------------"
    puts "Round #{number}"
    puts "-------------------------"
  end

  def show_question(question)
    puts "Question: #{question} "
  end

  def show_answer(question)
    puts "The answer is #{question.answer}"
  end

  def show_results(results)
    puts ""
    puts "Correct: #{results[true].length}"
    puts "Incorrect: #{results[false].length}"
  end

  def all_cards(deck)
    deck.map {|card| puts "Question: #{card.question}\n * * *\nAnswer: #{card.answer}\n---------------------------"}
  end

  def continue
    puts "Here we go again!"
  end

  def thanks
   puts "Thanks for playing!"
  end

end