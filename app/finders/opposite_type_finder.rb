class OppositeTypeFinder
  pattr_initialize :type

  def call
    Position::TYPES.reject { |key| type == key }.keys.first.constantize
  end
end
