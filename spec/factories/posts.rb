FactoryBot.define do
  factory :post do
    date { Date.today }
    rationale  { 'Some rationale' }
    user
  end
  
  factory :second_post, class: 'Post' do
    date { Date.today }
    rationale  { 'Second rationale' } 
    second_user
  end
end