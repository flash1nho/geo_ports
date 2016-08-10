class PositionService
  pattr_initialize :position

  def call
    ports = NearPortsFinder.new(position.port).call
    return if ports.blank?

    type = OppositePositionTypeFinder.new(position.type).call

    options = {
      type: type,
      port_ids: ports.map(&:id),
      capacity: position.capacity,
      date: position.date_open
    }

    PositionFinder.new(options).call
  end
end
