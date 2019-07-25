class User < ApplicationRecord
  attribute :admin, :boolean, default: false
  has_many :projects
  has_many :tasks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validation
  validates :username, uniqueness: true
  validates :admin, absence: true
  validates :email, :name, :username, :years_exp, :prog_lang, :country, presence: true
  # validates :email, :name, :username, :prog_lang, :country, numericality: false
end
