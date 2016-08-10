class NearPortsFinder
  pattr_initialize :port

  def call
    Port.near([port.lat, port.lng], 100, units: :km)
  end
end
