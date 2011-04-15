class Drug < ActiveRecord::Base
  has_many :children, :class_name => "Drug",
    :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Drug"
  
  # has_many :dosages
  has_many :indications

end
