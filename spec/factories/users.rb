FactoryBot.define do
  sequence :email do |n|
    "test#{n}@smartmail.gov"
  end
  
  factory :user do
    first_name 'John'
    last_name 'Doe'
    email { generate :email }
    password 'secret'
    password_confirmation 'secret'
  end
  
  factory :second_user, class: 'AdminUser' do
    first_name 'D'
    last_name 'Admin'
    email { generate :email }
    password 'secret'
    password_confirmation 'secret'
  end
end