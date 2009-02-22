class AddGuestColumns < ActiveRecord::Migration
  def self.up
    add_column :guests, :student_id,     :integer, :null => false
    add_column :guests, :signed_in_at,   :datetime
    add_column :guests, :signed_out_at,  :datetime
  end

  def self.down
    remove_column :guests, :student_id
    remove_column :guests, :signed_in_at
    remove_column :guests, :signed_out_at
  end
end
