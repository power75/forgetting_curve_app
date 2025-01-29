require 'rails_helper'

RSpec.describe Quiz, type: :model do
  let(:user) { create(:user) }
  let(:learning_history) { create(:learning_history, user: user) }
  let(:quiz) { create(:quiz, learning_history: learning_history, user: user) }

  describe 'バリデーション' do
    it 'タイトルが存在する場合、有効である' do
      quiz.title = 'Test Title'
      expect(quiz).to be_valid
    end

    it 'タイトルが存在しない場合、無効である' do
      quiz.title = nil
      expect(quiz).not_to be_valid
    end

    it 'コンテンツが存在する場合、有効である' do
      quiz.content = 'Test Content'
      expect(quiz).to be_valid
    end

    it 'コンテンツが存在しない場合、無効である' do
      quiz.content = nil
      expect(quiz).not_to be_valid
    end

    it 'サンプル回答が存在する場合、有効である' do
      quiz.sample_answer = 'Test Sample Answer'
      expect(quiz).to be_valid
    end

    it 'サンプル回答が存在しない場合、無効である' do
      quiz.sample_answer = nil
      expect(quiz).not_to be_valid
    end
  end

  describe 'アソシエーション' do
    it 'ユーザーに属している' do
      expect(quiz.user).to eq(user)
    end

    it '学習履歴に属している' do
      expect(quiz.learning_history).to eq(learning_history)
    end
  end
end
