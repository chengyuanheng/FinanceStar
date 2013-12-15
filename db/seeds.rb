
admin = FinanceStarUsers::User.find_by(admin:true)
if admin.nil?
  admin = FinanceStarUsers::User.new :name => "admin", :email => "admin@admin.com", :password => "admin", :phone => "18733171780" , :admin => true
  admin.save
end

user = FinanceStarUsers::User.find_by_name("dev")
if user.nil?
  user = FinanceStarUsers::User.new :name => "dev", :email => "dev@dev.com", :password => "dev" , :phone => "18733171781"
  user.save
end