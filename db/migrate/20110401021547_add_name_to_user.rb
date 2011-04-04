class AddNameToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :name_first, :string
    add_column :users, :name_last, :string
    add_column :users, :name_suffix, :string
    add_column :users, :name_middle, :string
  end

  def self.down
    remove_column :users, :name_middle
    remove_column :users, :name_suffix
    remove_column :users, :name_last
    remove_column :users, :name_first
  end
end
