class CreateFinanceManagementHomePages < ActiveRecord::Migration
  def change
    create_table :finance_management_home_pages do |t|

      t.timestamps
    end
  end
end
