class Port < ActiveRecord::Base
  validates :title, :lat, :lng, presence: true
end
