class AddAvatarToSource < ActiveRecord::Migration
  def self.up
  	add_attachment :sources, :avatar
  end

  def self.down
  	remove_attachment :sources, :avatar
  end
end
