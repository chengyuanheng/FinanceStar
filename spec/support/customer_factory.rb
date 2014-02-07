FactoryGirl.define do
  factory :customer, class: FinanceManagement::Customer do
    name "cc"
    phone "18733171780"
    email "237178842@qq.com"
    original_funds "100"
  end

  factory :customer_consume, class: FinanceManagement::CustomerConsume do
    customer_name "cc"
    consume "支出"
    consume_type "旅游"
    consume_value "1000"
    consume_describe "十一黄金周，全家去旅游"
  end

  factory :user_defined_consume_type, class: FinanceManagement::UserDefinedConsumeType do
    consume "支出"
    consume_type "旅游"
  end


end