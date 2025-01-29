require 'rails_helper'

RSpec.feature "LearningHistoryQuiz", type: :feature do
  include LoginMacros
  let(:user) { create(:user) }

  before do
    login(user)
  end

  scenario "学習記録とクイズを作成する" do
    visit new_learning_history_path

    fill_in 'learning_history_title', with: 'Test Learning History'
    fill_in 'learning_history_content', with: 'This is a test content for learning history.'
    fill_in 'learning_history_hour', with: 5
    fill_in 'learning_history_tags', with: 'tag1,tag2,tag3'
    fill_in 'learning_history_quiz_attributes_title', with: 'Test Quiz Title'
    fill_in 'learning_history_quiz_attributes_content', with: 'This is a test content for quiz.'
    fill_in 'learning_history_quiz_attributes_sample_answer', with: 'This is a sample answer.'

    click_button 'Create Learning history'

    expect(page).to have_content '学習記録を作成しました'

    visit learning_histories_path

    expect(page).to have_selector('tbody')

    within('tbody') do
      expect(page).to have_link('Test Learning History', href: /learning_histories\/\d+\?quiz=\d+/)
      click_link 'Test Learning History'
    end

    expect(page).to have_content '学習記録詳細'
    expect(page).to have_content 'Test Learning History'
    expect(page).to have_content 'This is a test content for learning history.'
    expect(page).to have_content '5'
    expect(page).to have_selector('img')
    expect(page).to have_content 'tag1'
    expect(page).to have_content 'tag2'
    expect(page).to have_content 'tag3'
    expect(page).to have_content 'Test Quiz Title'
    expect(page).to have_content 'This is a test content for quiz.'
    expect(page).to have_link('編集', href: edit_learning_history_path(LearningHistory.last))
    expect(page).to have_link('削除', href: learning_history_path(LearningHistory.last))

    visit quizzes_path

    expect(page).to have_link('Test Quiz Title', href: /quizzes\/\d+/)
    click_link 'Test Quiz Title'

    expect(page).to have_content 'Quiz実施'
    expect(page).to have_content 'Test Quiz Title'
    expect(page).to have_content 'This is a test content for quiz.'
    expect(page).to have_content 'User answer'

    click_button'Update Quiz'

    expect(page).to have_content 'Quiz結果'
    expect(page).to have_content 'Test Quiz Title'
    expect(page).to have_content 'This is a test content for quiz.'
    expect(page).to have_content 'This is a sample answer.'
    expect(page).to have_content 'あなたの回答'
    expect(page).to have_button('はい')
    expect(page).to have_button('いいえ')
    expect(page).to have_link('シェア', href: /https:\/\/twitter.com\/share/)
  end



  scenario "学習記録の作成に失敗する" do
    visit new_learning_history_path

    fill_in 'learning_history_title', with: ''
    fill_in 'learning_history_content', with: ''
    fill_in 'learning_history_hour', with: ''
    fill_in 'learning_history_quiz_attributes_title', with: ''
    fill_in 'learning_history_quiz_attributes_content', with: ''
    fill_in 'learning_history_quiz_attributes_sample_answer', with: ''

    click_button 'Create Learning history'

    expect(page).to have_content '作成に失敗しました'
  end
end
