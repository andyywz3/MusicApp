class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :album_id
      t.integer :band_id
      t.integer :track_num
      t.string :name

      t.timestamps
    end
  end
end
