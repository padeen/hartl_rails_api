FactoryBot.define do
  factory :user do
    name { "Harke" }
    email { "harke@harkema.net" }
    password { "password123" }
    password_confirmation { "password123" }
  end
end
