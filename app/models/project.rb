class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks
  attribute :status, :string, default: "Proposed"
  
end
