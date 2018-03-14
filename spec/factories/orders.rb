FactoryBot.define do 
  factory :order do 
    password { Faker::Number.between(10)}
    created_by { Faker::Number.number(10)}
  end
end