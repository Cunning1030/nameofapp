FactoryBot.define do
  
  sequence(:rating) { rand(1..5)}
  sequence(:body) { |n| "So good I could eat #{n}" }

  factory :comment do
    association :user, factory: :user
    association :product, factory: :product
    body
    rating
  end

end
