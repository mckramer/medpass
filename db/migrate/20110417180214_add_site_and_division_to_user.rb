class AddSiteAndDivisionToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :site_id, :integer
    add_column :users, :division_id, :integer
  end

  def self.down
    remove_column :users, :division_id
    remove_column :users, :site_id
  end
end
