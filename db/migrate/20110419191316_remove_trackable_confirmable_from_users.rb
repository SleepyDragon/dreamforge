class RemoveTrackableConfirmableFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :confirmation_token
    remove_column :users, :confirmed_at
    remove_column :users, :confirmation_sent_at
    remove_column :users, :sign_in_count
    remove_column :users, :current_sign_in_at
    remove_column :users, :last_sign_in_at
    remove_column :users, :current_sign_in_ip
    remove_column :users, :last_sign_in_ip
  end

  def self.down
    add_column :users, :last_sign_in_ip, :string
    add_column :users, :current_sign_in_ip, :string
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :sign_in_count, :integer,                       :default => 0
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_token, :string
  end
end
