class Album < ActiveRecord::Base
  attr_accessible :name, :genre, :recorded, :band_id

  belongs_to :band
  has_many :tracks, dependent: :destroy
end
