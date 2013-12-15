# This migration comes from finance_star_users (originally 20131215221305)
class CreateFinanceStarUsersUserVerifyCodes < ActiveRecord::Migration
  def change
    create_table :finance_star_users_user_verify_codes do |t|
      t.string :user_id
      t.string :code

      t.timestamps
    end
  end
end
