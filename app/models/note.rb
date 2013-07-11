class Note < ActiveRecord::Base
  attr_accessible :track_id, :body

  belongs_to :track
end
