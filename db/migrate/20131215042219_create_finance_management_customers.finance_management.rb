# This migration comes from finance_management (originally 20131215042002)
class CreateFinanceManagementCustomers < ActiveRecord::Migration
  def change
    create_table :finance_management_customers do |t|
      t.string :user_id
      t.string :name
      t.string :phone
      t.string :email
      t.string :original_funds

      t.timestamps
    end
  end
end
