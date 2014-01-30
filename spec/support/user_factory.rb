FactoryGirl.define do

  factory :non_admin_user, class: FinanceStarUsers::User do
    name "non_admin_user"
    email "dev@dev.com"
    password "123"
    phone "11111111111"
  end

  factory :admin, class: FinanceStarUsers::User do
    name "admin_user"
    email "admin@admin.com"
    password "123"
    phone "77777777777"
    admin true
  end

end