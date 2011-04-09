class AddNullableEmailToUser < ActiveRecord::Migration
  def self.up
    change_column :users, :email, :string, :default => ""
  end

  def self.down
  end
end
