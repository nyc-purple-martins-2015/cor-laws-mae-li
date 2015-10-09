require_relative "view"

class Game

  attr_reader :deck, :load_array, :questions, :answers

  def initialize(args = {})
    @deck = []
    @load_array =[]
    @questions = []
    @answers = []
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
      "Question: #{@deck[index].question}"
  end

  def correct?(args)
    if args == @deck[0].answer
      return true
    end
  end

  def answer_question
  end

end




# start game, ask questions, receive answers, give results, and move to next question
