class Card

attr_reader :question, :answer
attr_accessor :status


  def initialize(args={})
    @question = args.fetch(:question)
    @answer = args.fetch(:answer)
    @status = args.fetch(:status, false)
  end

  def show_card
    "Question: #{question}\nAnswer: #{answer}\n ----------------------------------------------"
  end

end
