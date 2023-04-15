class Task < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :name, presence: true
  validates :deadline, presence: true
end
