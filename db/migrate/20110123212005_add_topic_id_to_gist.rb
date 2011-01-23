class AddTopicIdToGist < ActiveRecord::Migration
  def self.up
    add_column :gists, :topic_id, :integer
  end

  def self.down
    remove_column :gists, :topic_id
  end
end
