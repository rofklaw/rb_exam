class Lender < ActiveRecord::Base
  belongs_to :borrower
  has_many :transactions
  has_many :borrowers, through: :transactions
  has_secure_password

  #validations
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: { in: 2..30 }
  validates :money, presence: true, numericality: { greater_than: 0 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
