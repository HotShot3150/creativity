# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    title "MyString"
    body "MyText"
    user_id 1
    category_id 1
    slug "MyString"
  end
end
