class AddLyricsToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :lyrics, :text
    add_column :tracks, :kind, :text
  end
end
