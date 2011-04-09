class RemoveIndexFromUsers < ActiveRecord::Migration
  def self.up
    remove_index :users, :name => :email
  end

  def self.down
  end
end
