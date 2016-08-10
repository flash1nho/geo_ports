# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ports_ary = JSON.parse(File.open("#{Rails.root}/db/json/ports.json").read, symbolize_names: true)

ports_ary.each do |port_item|
  port = Port.find_or_create_by(title: port_item[:title])

  port.update_attributes(lat: port_item[:lat], lng: port_item[:lng])
end
