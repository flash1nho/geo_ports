class PositionFinder
  pattr_initialize :options

  def call
    options[:type].
      by_port(options[:port_ids]).
      by_capacity(options[:capacity]).
      by_date(options[:date]).
      first
  end
end
