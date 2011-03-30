class CreateAllergens < ActiveRecord::Migration
  def self.up
    create_table :allergens do |t|
      t.string :name
      t.string :abbr
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :allergens
  end
end
