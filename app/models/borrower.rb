class Borrower < ActiveRecord::Base
  belongs_to :lender
  has_many :transactions
  has_many :lenders, through: :transactions
  has_secure_password

  #validations
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :need, presence: true, length: { in: 2..30 }
  validates :description, presence: true, length: {in: 2..255}
  validates :goal, presence: true, numericality: { greater_than: 0 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
