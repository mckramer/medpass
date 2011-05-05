class Drug < ActiveRecord::Base
  has_many :children, :class_name => "Drug",
    :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Drug"
  
  has_many :dosages, :dependent => :destroy
  has_many :indications, :dependent => :destroy
  
  validates_presence_of :name, :description

end
