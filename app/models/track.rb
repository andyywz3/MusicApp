class Track < ActiveRecord::Base
  attr_accessible :name, :track_num, :album_id, :band_id, :kind, :lyrics

  belongs_to :album
  has_one :band, through: :album
  has_many :notes, dependent: :destroy
end
