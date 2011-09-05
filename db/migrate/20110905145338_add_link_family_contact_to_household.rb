class AddLinkFamilyContactToHousehold < ActiveRecord::Migration
  def self.up
    add_column :households, :link_family_contact_id, :integer
  end

  def self.down
    remove_column :households, :link_family_contact_id
  end
end
