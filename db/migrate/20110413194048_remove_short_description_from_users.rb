class RemoveShortDescriptionFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :short_description
  end

  def self.down
  end
end
