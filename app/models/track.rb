class Track < ActiveRecord::Base
  attr_accessible :name, :track_num

  belongs_to :album
  has_one :band, through: :album
end
