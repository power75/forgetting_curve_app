# frozen_string_literal: true

class LearningHistory < ApplicationRecord
  belongs_to :user
  has_one :quiz, dependent: :destroy
  has_many :learning_history_tag_relations, dependent: :destroy
  has_many :tags, through: :learning_history_tag_relations
  accepts_nested_attributes_for :quiz, allow_destroy: true
  validates :title, presence: true
  validates :content, length: { maximum: 4000 }
  validates :hour, presence: true, numericality: { only_integer: true, greater_than: 0 } # 正の整数を指定
  enum status: { incomplete: 0, complete: 1 }

  mount_uploader :image, LearningHistoryImageUploader

  def self.ransackable_attributes(_auth_object = nil)
    ['title']
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[learning_history_tag_relations quiz tags user]
  end

  def add_tags(tag_names)
    tag_names.each do |tag_name|
      tag = Tag.find_or_create_by(name: tag_name.strip)
      tags << tag
    end
  end

  def increment_count
    self.count += 1
    save
  end
end
