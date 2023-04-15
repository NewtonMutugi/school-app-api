class Task < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :deadline, presence: true
end
