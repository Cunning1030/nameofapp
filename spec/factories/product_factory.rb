FactoryBot.define do
  
  sequence(:name) { |n| "product#{n}" }
  sequence(:description) { |n| "description#{n}" }
  sequence(:image_url) { |n| "product#{n}.jpg" }
  sequence(:size) { |n| "#{n} by #{n} in." }
  sequence(:price) { rand(1.0..100.0)}

  factory :product do
    name
    description
    image_url
    size
    price
  end

end
