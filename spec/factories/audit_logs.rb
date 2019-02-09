FactoryBot.define do
  factory :audit_log do
    user
    status { 1 }
    start_date { Date.today - 6.days }
    end_date { "2019-02-20" }
  end
  
  factory :second_audit_log, class: 'ActivityLog' do
    second_user
    status { 0 }
    start_date { Date.today - 6.days }
    end_date { "2025-12-9" }
  end
end
