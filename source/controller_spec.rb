require_relative 'card.rb'
require_relative 'game.rb'
require_relative 'controller.rb'

describe "game" do

  let(:new_game) { Game.new() }
  let(:new_view) { View.new()}

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