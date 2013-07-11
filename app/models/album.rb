class Album < ActiveRecord::Base
  attr_accessible :name, :genre

  belongs_to :band
  has_many :tracks, dependent: :destroy
end
