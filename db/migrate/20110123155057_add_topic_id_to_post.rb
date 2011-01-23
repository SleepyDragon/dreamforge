class AddTopicIdToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :topic_id, :integer
  end

  def self.down
    remove_column :posts, :topic_id
  end
end
