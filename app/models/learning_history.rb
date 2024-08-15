class LearningHistory < ApplicationRecord
  belongs_to :user
  has_one :quiz
  accepts_nested_attributes_for :quiz
  validates :title, presence: true
  validates :content, length: { maximum: 4000}
  validates :hour, presence: true, numericality: { only_integer: true, greater_than: 0 } # 正の整数を指定
  enum status: {incomplete: 0, complete: 1}

  mount_uploader :image, LearningHistoryImageUploader
end
