class View

  def initialize
  end

  def start_game
    puts "Are you ready to play?"
    answer = gets.chomp
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

end
