class Game

  attr_reader :deck, :load_array, :questions, :answers, :correct, :incorrect, :results

  def initialize(args = {})
    @deck = []
    @load_array =[]
    @questions = []
    @answers = []
    @correct = []
    @incorrect = []
  end

  def load_cards(filename)
    File.open(filename).each do |line|
      @load_array << line.chomp
      @load_array.keep_if {|item| item != ""}
    end
  end

  def create_cards
    @load_array.each_with_index do |line, index|
      if index%2 == 0
        @questions << line
      elsif index%2 != 0
        @answers << line
      end
    end
    @questions.each_with_index { |question, index| @deck << Card.new(question: question, answer: @answers[index]) }
  end

  def ask_question(index)
    @deck[index].question
  end

  def correct?(user_input, index)
    if user_input == @deck[index].answer
      @deck[index].status = true
      return true

    end
  end

  def answer_question(index)
    @deck[index].answer
  end

  def show_deck
    new_deck = deck.map {|card| card.show_card}
    new_deck
  end

  def count_results
    @results = @deck.group_by {|card| card.status == true}
  end

  def reset_deck
    @deck = @results[false]
  end

end




# start game, ask questions, receive answers, give results, and move to next question
