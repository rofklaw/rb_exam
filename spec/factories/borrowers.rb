FactoryGirl.define do
  factory :borrower do
    first_name "MyString"
    last_name "MyString"
    email "MyString"
    password ""
    need "MyString"
    description "MyString"
    goal 1
    current 1
    lender nil
  end
end
