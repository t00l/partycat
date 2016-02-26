class Liquorstore < ActiveRecord::Base
  
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude

  after_validation :geocode, :if => :address_changed?
  after_validation :reverse_geocode

  #associations
  belongs_to :user
  has_many :comments
  
end
