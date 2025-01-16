# frozen_string_literal: true

class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :learning_histories, :dependent => :destroy
  has_many :quizzes, :dependent => :destroy
  has_many :notifications, :dependent => :destroy
  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications
  validates :name, length: { maximum: 32 }
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true, presence: true
  validates :reset_password_token, uniqueness: true, allow_nil: true
  enum preferred_notification_method: { email: 0, line: 1 }
  validates :preferred_notification_method, inclusion: { in: preferred_notification_methods.keys }
end
