class Allergy < ActiveRecord::Base
  belongs_to :user
  belongs_to :allergen
  
  validates_uniqueness_of :allergen_id, :scope => :user_id
end
