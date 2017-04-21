class Transaction < ActiveRecord::Base
  belongs_to :borrowers 
  belongs_to :lenders
end
