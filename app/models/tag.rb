class Tag < ApplicationRecord
  has_many :learning_history_tag_relations, dependent: :destroy
  has_many :learning_histories, through: :learning_history_tag_relations
  validates :name, length: { maximum: 16}
  validates :name, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at"]
    end
end
