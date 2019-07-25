class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user

  # Validation
  validates :status, :name, :task, presence: true
  validates :status, :name, :task, numericality: false
end
