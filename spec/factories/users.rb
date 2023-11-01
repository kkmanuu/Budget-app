FactoryBot.define do
  factory :user do
    name { 'Mission' }
    email { 'mission@gmail.com' }
    password { 'password6666' }
    password_confirmation { 'password6666' }
  end
end
