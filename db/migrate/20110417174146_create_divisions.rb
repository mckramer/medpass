class CreateDivisions < ActiveRecord::Migration
  def self.up
    create_table :divisions do |t|
      t.string :name
      t.string :abbr
      t.references :site

      t.timestamps
    end
  end

  def self.down
    drop_table :divisions
  end
end
