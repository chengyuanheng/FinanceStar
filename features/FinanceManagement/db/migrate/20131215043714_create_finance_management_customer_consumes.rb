class CreateFinanceManagementCustomerConsumes < ActiveRecord::Migration
  def change
    create_table :finance_management_customer_consumes do |t|
      t.string :customer_id
      t.string :consume
      t.string :consume_type
      t.string :consume_value

      t.timestamps
    end
  end
end