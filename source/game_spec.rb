require_relative 'game'
require_relative 'card'

describe 'Game' do
let(:card) {Card.new(question: "What is coding?", answer: "fun")}
let(:game) {Game.new}

 describe '#load_cards' do
   it 'should load an array of strings from a file' do
    game.load_cards('flashcard_samples2.txt')
    expect(game.load_array[0]).to be_a(String)
   end
   it 'should create an array with odd numbered items as answers' do
    game.load_cards('flashcard_samples2.txt')
    expect(game.load_array[3]).to eql("and")
   end
   it 'should create an array with even numbered items as questions' do
    game.load_cards('flashcard_samples2.txt')
    expect(game.load_array[2]).to eql("A command that appends two or more objects together.")
   end
 end

  describe '#create_cards' do
    it 'each item in @questions should be a question' do
      game.load_cards('flashcard_samples2.txt')
      game.create_cards
      expect(game.questions[0].split(" ").length).to be > 3
    end
    it 'each item in @answers should be an answer' do
      game.load_cards('flashcard_samples2.txt')
      game.create_cards
      expect(game.answers[0].split(" ").length).to be < 3
    end
    it 'should return an array of objects called @deck with an attribute called \'question\'' do
      game.load_cards('flashcard_samples2.txt')
      game.create_cards
      expect(game.deck[0].question).to eql("To create a second name for the variable or method.")
    end
    it 'should return an array of objects called @deck with an attribute called \'answer\'' do
      game.load_cards('flashcard_samples2.txt')
      game.create_cards
      expect(game.deck[0].answer).to eql("alias")
    end
    it 'should return an array of objects called @deck with an attribute called \'status\'' do
      game.load_cards('flashcard_samples2.txt')
      game.create_cards
      expect(game.deck[0].status).to eql(false)
    end
  end

  describe '#correct?' do
  it 'should return true if the guess is correct' do 

  game.load_cards('flashcard_samples2.txt')
  game.create_cards

  expect(game.correct?("alias", 0)).to eq(true)
  end 

  it 'should return false if the guess is incorrect' do 

  game.load_cards('flashcard_samples2.txt')
  game.create_cards

  expect(game.correct?("albert", 0)).to eq(false)
  end
 end
  

end
