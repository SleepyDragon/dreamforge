class AddOtherFieldsToGist < ActiveRecord::Migration
  def self.up
    add_column :gists, :actions, :text
    add_column :gists, :fictional_author, :string
  end

  def self.down
    remove_column :gists, :fictional_author
    remove_column :gists, :actions
  end
end
