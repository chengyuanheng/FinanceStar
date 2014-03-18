# This migration comes from finance_star_users (originally 20140317065409)
class CreateFinanceStarUsersSmsRecords < ActiveRecord::Migration
  def change
    create_table :finance_star_users_sms_records do |t|
      t.integer :user_id
      t.string :content
      t.string :phone
      t.string :has_send, :default => false

      t.timestamps
    end
  end
end
