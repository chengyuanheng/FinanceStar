class CreateFinanceStarUsersUsers < ActiveRecord::Migration
  def change
    create_table :finance_star_users_users do |t|
      t.text :name
      t.text :email
      t.text :password
      t.text :phone
      t.boolean :admin, :default => false

      t.timestamps
    end
  end
end
