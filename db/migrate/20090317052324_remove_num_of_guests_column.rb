class RemoveNumOfGuestsColumn < ActiveRecord::Migration
  def self.up
    remove_column :students, :num_of_guests
  end

  def self.down
    add_column :students, :num_of_guests, :integer, :default => 0
  end
end
