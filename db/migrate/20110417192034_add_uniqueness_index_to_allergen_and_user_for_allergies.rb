class AddUniquenessIndexToAllergenAndUserForAllergies < ActiveRecord::Migration
  def self.up
    add_index :allergies, [:user_id, :allergen_id], :unique => true
  end

  def self.down
    remove_index :allergies, :column => [:user_id, :allergen_id]
  end
end
