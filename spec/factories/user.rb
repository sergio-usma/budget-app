FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    email { 'johndoe@example.com' }
    password { '1234567890' }
    confirmed_at { Time.now }
  end
end
