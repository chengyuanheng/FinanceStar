# This migration comes from finance_management (originally 20131219233100)
class CreateFinanceManagementUserDefinedConsumesTypes < ActiveRecord::Migration
  def change
    create_table :finance_management_user_defined_consume_types do |t|
      t.string :user_id
      t.string :consume
      t.string :consume_type

      t.timestamps
    end
  end
end
