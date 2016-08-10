class Position < ActiveRecord::Base
  TYPES = {
    'Positions::Vessel' => 'Судно',
    'Positions::Cargo' => 'Груз'
  }

  belongs_to :port

  validates :title, :port, :date_open, :capacity, :type, presence: true

  scope :by_date, ->(date) do
    where('date_open >= ? AND date_open <= ?', date, date)
  end

  scope :by_port, ->(ids) do
    where(port_id: ids)
  end
end
