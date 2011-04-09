class AddNullEmailToUser < ActiveRecord::Migration
  def self.up
    change_column :users, :email, :string, :default => "", :null => true
  end

  def self.down
  end
end
