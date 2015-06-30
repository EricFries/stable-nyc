require 'pry'
class PDFParser
  attr_accessor :reader, :raw_extracted_pages, :hash_buildings

  def self.parse
    self.new.call
  end

  def initialize
    @reader = PDF::Reader.new("./data/2013BrooklynBldgs.pdf")
    @raw_extracted_pages = []
    @hash_buildings = {}
    extract_pages_to_text
    extract_buildings
    remove_irregular_building_nums
    remove_two_building_entries
  end

  def call
    @hash_buildings.each do |index, building|
      build_buildings(building)
    end
  end

  def build_buildings(building)
    Building.create(building)
  end

  # Parses PDF into an array of pages containing arrays of each line of the PDF.

  def extract_pages_to_text
    @reader.pages.each do |page|
      @raw_extracted_pages << page.text.split("\n")
    end
  end

  # Splits each building entry into an array with address details
  # Extracts to a hash

  def extract_buildings
    counter = 1
    @raw_extracted_pages.each do |page|
      page.each do |line|
        building_info = line.split(" ")
          if !building_info.empty? && building_info[0] != "ZIP" && !building_info[0].start_with?("Brooklyn") && !building_info[0].start_with?("Source")
            hash_buildings[counter] = {
              :zip => building_info[0],
              :building_num => building_info[1],
              :street => building_info[2],
              :street_suffix => building_info[3],
              :city => building_info[4]}
            counter += 1
          end
        end
      end
  end

  def remove_irregular_building_nums
    @hash_buildings.each do |index, building|
      if building[:building_num].include?("(TO(")
        hash_buildings.delete(index)
      end
    end
  end

  def remove_two_building_entries
    @hash_buildings.each do |index,building|
      if building[:city].include?("(TO(")
        hash_buildings.delete(index)
      end
    end
  end
end