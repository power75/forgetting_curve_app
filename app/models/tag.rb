class Tag < ApplicationRecord
  has_many :learning_history_tag_relations, dependent: :destroy
  has_many :learning_histories, through: :learning_history_tag_relations
  validates :name, length: { maximum: 16}
  validates :name, uniqueness: true
end
