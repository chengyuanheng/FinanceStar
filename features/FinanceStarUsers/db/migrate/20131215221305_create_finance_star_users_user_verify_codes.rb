class CreateFinanceStarUsersUserVerifyCodes < ActiveRecord::Migration
  def change
    create_table :finance_star_users_user_verify_codes do |t|
      t.string :user_id
      t.string :code

      t.timestamps
    end
  end
end
