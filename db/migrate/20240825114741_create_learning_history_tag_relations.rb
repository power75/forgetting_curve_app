class CreateLearningHistoryTagRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :learning_history_tag_relations do |t|
      t.references :learning_history, foreign_key: true, null: false
      t.references :tag, foreign_key: true, null: false

      t.timestamps
    end
    add_index :learning_history_tag_relations, [:learning_history_id, :tag_id], unique: true, name: 'index_lh_tr'
    # タグの重複を防ぐ
  end
end
