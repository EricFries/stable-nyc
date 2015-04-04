class Building < ActiveRecord::Base
  belongs_to :office
  has_many :statuses
end
