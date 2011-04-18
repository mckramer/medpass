class Allergen < ActiveRecord::Base
  has_many :allergies
  has_many :users, :through => :allergies
end
