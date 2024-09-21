# frozen_string_literal: true

class CreateLearningHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :learning_histories do |t|
      t.string :title, null: false
      t.text :content
      t.string :image
      t.integer :hour, null: false
      t.integer :count, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
