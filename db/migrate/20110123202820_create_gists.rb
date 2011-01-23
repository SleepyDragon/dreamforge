class CreateGists < ActiveRecord::Migration
  def self.up
    create_table :gists do |t|
      t.string :type
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :gists
  end
end
