require 'rails_helper'

RSpec.describe LearningHistory, type: :model do
  let(:user) { create(:user) }
  let(:learning_history) { create(:learning_history, user: user) }


  describe 'バリデーション' do
    it 'タイトルが存在する場合、有効である' do
      learning_history.title = 'Test Title'
      expect(learning_history).to be_valid
    end

    it 'タイトルが存在しない場合、無効である' do
      learning_history.title = nil
      expect(learning_history).not_to be_valid
    end

    it 'コンテンツが4000文字以内である場合、有効である' do
      learning_history.content = 'a' * 4000
      expect(learning_history).to be_valid
    end

    it 'コンテンツが4000文字を超える場合、無効である' do
      learning_history.content = 'a' * 4001
      expect(learning_history).not_to be_valid
    end

    it '時間が正の整数である場合、有効である' do
      learning_history.hour = 1
      expect(learning_history).to be_valid
    end

    it '時間が0以下の場合、無効である' do
      learning_history.hour = 0
      expect(learning_history).not_to be_valid
    end

    it '時間が整数でない場合、無効である' do
      learning_history.hour = 1.5
      expect(learning_history).not_to be_valid
    end
  end

end
