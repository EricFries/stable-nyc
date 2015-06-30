class Building < ActiveRecord::Base
  #Although not in database, borough is added so simpleform can collect this in params to render the proper DHCR map to users who search for buildings not in the database.
  attr_accessor :borough
  belongs_to :office
  has_many :statuses
end
