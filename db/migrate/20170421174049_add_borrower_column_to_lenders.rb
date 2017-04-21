class AddBorrowerColumnToLenders < ActiveRecord::Migration
  def change
    add_reference :lenders, :borrower, index: true, foreign_key: true
  end
end
