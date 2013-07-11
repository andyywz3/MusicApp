class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :user_token
      t.string :status, default: "deactivated"

      t.timestamps
    end
  end
end
