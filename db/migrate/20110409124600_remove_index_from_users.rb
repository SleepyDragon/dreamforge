class RemoveIndexFromUsers < ActiveRecord::Migration
  def self.up
    remove_index :users, :email
  end

  def self.down
  end
end
