class View

  def initialize
  end

  def start_game
    puts "Are you ready to play?"
    answer = gets.chomp
  end

  def end_game
    puts "Finished for now."
  end

  def get_answer
    answer = gets.chomp
  end

  def response(arg)
    if arg == true
      puts "Correct"
    else
      puts "Incorrect"
    end
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
end
