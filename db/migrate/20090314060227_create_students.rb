class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string :name, :student_id, :room, :phone
      t.integer :num_of_guests, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end
