class Card

attr_reader :question, :answer

  def initialize(args={})
    @question = args.fetch(:question)
    @answer = args.fetch(:answer)
  end

  def show_card
    "Question: #{question}\nAnswer: #{answer}\n ----------------------------------------------"
  end
end
