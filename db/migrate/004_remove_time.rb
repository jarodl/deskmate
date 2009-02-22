class RemoveTime < ActiveRecord::Migration
  def self.up
    remove_column :guests, :signed_in_at
    remove_column :guests, :signed_out_at
  end

  def self.down
    add_column :guests, :signed_in_at
    add_column :guests, :signed_out_at
  end
end
