class Unit < ApplicationRecord
  has_many :courses
  has_many :users, through: :courses
  has_many :tasks

  validates :name, presence: true
  validates :venue, presence: true
  validates :day_of_week, presence: true
  validates :duration, presence: true
end
