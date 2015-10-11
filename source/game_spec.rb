require 'csv'
require_relative 'game'
require_relative 'card'
require_relative 'controller.rb'


describe 'Game' do
 let(:new_game) { Game.new() }
 let(:card) { Card.new()}

  describe '#load_cards' do
  end

  describe '#create_cards' do
  end

  describe '#ask_question' do
 		it 'expects ask_question to return the correct question' do

 			new_game.load_cards('flashcard_samples2.txt')
    	new_game.create_cards 
  		
  		expect(new_game.ask_question(0)).to eq("To create a second name for the variable or method.")
  	end

  	it 'expects ask_question to return the correct question' do

 			new_game.load_cards('flashcard_samples2.txt')
    	new_game.create_cards 
  		
  		expect(new_game.ask_question(3)).to eq("Delimits a \"begin\" block of code, which can allow the use of while and until in modifier position with multi-line statements.")
  	end

  end

  describe '#correct?' do
  	it 'should return true if the guess is correct' do 

  		new_game.load_cards('flashcard_samples2.txt')
  		new_game.create_cards

  		expect(new_game.correct?("alias", 0)).to eq(true)
  	end 

  	it 'should return false if the guess is incorrect' do 

  		new_game.load_cards('flashcard_samples2.txt')
  		new_game.create_cards

  		expect(new_game.correct?("alien", 0)).to eq(false)
  	end
  end

   describe 'answer_question' do

     it 'returns the correct answer' do
       new_game.load_cards('flashcard_samples2.txt')
       new_game.create_cards
       expect(new_game.answer_question(0)).to eq('alias')
     end

     it 'returns a string' do
       new_game.load_cards('flashcard_samples2.txt')
       new_game.create_cards
       expect(new_game.answer_question(0)).to be_a String
     end
   end



   describe 'count_results' do
    
     it 'returns a hash' do
       new_game.load_cards('flashcard_samples2.txt')
       new_game.create_cards
       expect(new_game.count_results).to be_a Hash
     end
   end

   describe 'reset_deck' do
     
     it 'returns an array' do
       new_game.load_cards('flashcard_samples2.txt')
       new_game.create_cards
       expect(new_game.reset_deck).to be_a Array
     end
   end
end