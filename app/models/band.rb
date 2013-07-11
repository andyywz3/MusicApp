class Band < ActiveRecord::Base
  attr_accessible :name

  has_many :albums
  has_many :tracks, through: :albums

end
