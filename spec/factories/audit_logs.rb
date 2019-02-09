FactoryBot.define do
  factory :audit_log do
    user { nil }
    status { 1 }
    start_date { "2019-02-09" }
    end_date { "2019-02-09" }
  end
end
