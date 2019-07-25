class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks
  attribute :status, :string, default: "Proposed"

  # Validation
  validates :status, :name, :description, presence: true
  validates :status, :name, :description, numericality: false

end
