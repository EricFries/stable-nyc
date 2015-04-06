# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'    

#Adds buildings to database from CSV exported from original Sinatra app
csv_text = File.read('db/buildings.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  Building.create!(row.to_hash)

#Adds offices to database from CSV exported from original Sinatra app
# csv_text = File.read('db/offices.csv')
# csv = CSV.parse(csv_text, :headers => true)
# csv.each do |row|
#   Office.create!(row.to_hash)
end