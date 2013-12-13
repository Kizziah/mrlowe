# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appointment do
    hour "MyString"
    date "MyString"
    active false
  end
end
