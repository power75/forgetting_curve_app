# frozen_string_literal: true

class CreateQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :quizzes do |t|
      t.string :title
      t.text :content
      t.text :sample_answer
      t.text :user_answer
      t.references :learning_history, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
