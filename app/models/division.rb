class Division < ActiveRecord::Base
  belongs_to :site
  has_many :users
  
  attr_accessible :name, :abbr, :site_id
  
  validates_presence_of :name
end
