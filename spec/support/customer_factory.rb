FactoryGirl.define do
  factory :customer, class: FinanceManagement::Customer do
    name "cc"
    phone "18733171780"
    email "237178842@qq.com"
    original_funds "100"
  end
end