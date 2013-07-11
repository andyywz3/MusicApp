class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.email :email
      t.password :password
      t.token :user_token
      t.string :status

      t.timestamps
    end
  end
end
