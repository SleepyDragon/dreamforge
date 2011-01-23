class AddNameAndShortDescriptionToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string
    add_column :users, :short_description, :string
  end

  def self.down
    remove_column :users, :short_description
    remove_column :users, :name
  end
end
