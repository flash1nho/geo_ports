class Position < ActiveRecord::Base
  TYPES = {
    'Positions::Vessel' => 'Судно',
    'Positions::Cargo' => 'Груз'
  }

  belongs_to :port

  validates :title, :port, :date_open, :capacity, :type, presence: true
end
