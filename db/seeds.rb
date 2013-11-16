
admin = FinanceStarUsers::User.find_by_admin(true)
if admin.nil?
  admin = FinanceStarUsers::User.new :name => "admin", :password => "admin", :email => "admin@admin.com", :phone => 18733171780 , :admin => true
  admin.save!
end

user = FinanceStarUsers::User.find_by_name("dev")
if user.nil?
  user = FinanceStarUsers::User.new :name => "dev", :phone => "10086", :email => "dev@dev.com", :password => "dev"
  user.save
end