class LearningHistory < ApplicationRecord
  belongs_to :user
  has_one :quiz, dependent: :destroy
  has_many :learning_history_tag_relations, dependent: :destroy
  has_many :tags, through: :learning_history_tag_relations
  accepts_nested_attributes_for :quiz, allow_destroy: true
  validates :title, presence: true
  validates :content, length: { maximum: 4000}
  validates :hour, presence: true, numericality: { only_integer: true, greater_than: 0 } # 正の整数を指定
  enum status: {incomplete: 0, complete: 1}

  mount_uploader :image, LearningHistoryImageUploader

  def self.ransackable_attributes(auth_object = nil)
    ["title"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["learning_history_tag_relations", "quiz", "tags", "user"]
  end
end
