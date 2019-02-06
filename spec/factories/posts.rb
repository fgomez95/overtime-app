FactoryBot.define do
  factory :post do
    date { Date.today }
    rationale  { 'Some rationale' }
    overtime_request { Random.rand(0.1..5)}
    user
  end
  
  factory :second_post, class: 'Post' do
    date { Date.today }
    rationale  { 'Second rationale' } 
    overtime_request { Random.rand(0.1..5)}
    second_user
  end
end