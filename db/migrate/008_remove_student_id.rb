class RemoveStudentId < ActiveRecord::Migration
  def self.up
    remove_column :guests, :student_id
  end

  def self.down
    add_column :guests, :student_id, :integer
  end
end
