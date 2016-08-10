class Port < ActiveRecord::Base
  has_many :positions, dependent: :destroy

  validates :title, :lat, :lng, presence: true

  reverse_geocoded_by :lat, :lng
  after_validation :reverse_geocode
end
