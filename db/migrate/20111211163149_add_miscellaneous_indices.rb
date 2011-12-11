class AddMiscellaneousIndices < ActiveRecord::Migration
  def change
    add_index :forums, :category_id
    add_index :gists, :topic_id
    add_index :posts, :topic_id
    add_index :posts, :user_id
    add_index :topics, :forum_id
  end
end
