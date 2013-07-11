class AddRecordedToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :recorded, :string, default: "studio"
  end
end
