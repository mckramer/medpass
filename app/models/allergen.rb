class Allergen < ActiveRecord::Base
  has_many :sufferers, :class_name => :users
end
