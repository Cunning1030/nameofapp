FactoryBot.define do
  sequence(:email) { |n| "username-#{n}@test.com" }

  factory :user do
    first_name "valid"
    last_name "user"
    email
    password "12345678"
    admin false
  end

  factory :invalid_email_user , class: User do
    first_name "invalid"
    last_name "user"
    email {"#{first_name} #{last_name}"}
    password "12345678"
    admin false
  end

  factory :admin , class: User do
    first_name  "admin"
    last_name "user"
    email
    password "12345678"
    admin true
  end

end
