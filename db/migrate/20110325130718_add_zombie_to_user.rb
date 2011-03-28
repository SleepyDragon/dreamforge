class AddZombieToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :zombie, :boolean, :default => false
  end

  def self.down
    remove_column :users, :zombie
  end
end
