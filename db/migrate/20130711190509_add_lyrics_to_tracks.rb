class AddLyricsToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :lyrics, :text
    add_column :tracks, :type, :text
  end
end
