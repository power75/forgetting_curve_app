class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :learning_histories
  has_many :quizzes
  has_many :notifications
  validates :name, length: { maximum: 32 }
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true, presence: true
  validates :reset_password_token, uniqueness: true, allow_nil: true
end
