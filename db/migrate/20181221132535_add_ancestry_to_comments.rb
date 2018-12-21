class AddAncestryToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :ancestry, :string
  end

  def self.up
    add_column :comments, :ancestry, :string
    add_index :comments, :ancestry
  end

  def self.down
    remove_index :comments, :ancestry
    remove_column :comments, :ancestry
  end
end
