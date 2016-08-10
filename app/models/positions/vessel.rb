module Positions
  class Vessel < Position
    scope :by_capacity, ->(capacity) do
      where('capacity >= ?', capacity)
    end
  end
end
