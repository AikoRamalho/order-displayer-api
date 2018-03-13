FactoryBot.define do 
  factory :order do 
    password { Faker::Number.between(10)}
  end
end