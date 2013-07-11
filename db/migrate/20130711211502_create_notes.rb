class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :track_id
      t.string :body

      t.timestamps
    end
  end
end
