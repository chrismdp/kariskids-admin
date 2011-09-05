class AddSupporterFieldToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :supporter, :boolean, :default => false
  end

  def self.down
    remove_column :users, :supporter
  end
end
