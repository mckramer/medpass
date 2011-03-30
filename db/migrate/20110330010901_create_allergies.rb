class CreateAllergies < ActiveRecord::Migration
  def self.up
    create_table :allergies do |t|
      t.references :user
      t.references :allergen

      t.timestamps
    end
  end

  def self.down
    drop_table :allergies
  end
end
