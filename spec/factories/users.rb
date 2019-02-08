FactoryBot.define do
  sequence :email do |n|
    "test#{n}@smartmail.gov"
  end
  
  factory :user do
    first_name { 'John' }
    last_name { 'Doe' }
    email { generate :email }
    password { 'secret' }
    password_confirmation { 'secret' }
    phone_number { "55555555" }
  end
  
  factory :admin_user, class: 'AdminUser' do
    first_name { 'D' }
    last_name { 'Admin' }
    email { generate :email }
    password { 'secret' }
    password_confirmation { 'secret' }
    phone_number { "55555555" }
  end
  
  factory :non_authorized_user, class: 'User' do
    first_name { 'Unauthorized' }
    last_name { 'Entity' }
    email { generate :email }
    password { 'secret' }
    password_confirmation { 'secret' }
    phone_number { "55555555" }
  end
end