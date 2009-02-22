class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.column :name,           :string
      t.column :student_id,      :string, :limit => 9
      t.column :room,           :string, :limit => 3
      t.column :phone,          :string, :limit => 12
      t.column :num_of_guests,  :integer, :default => 0
    end
  end

  def self.down
    drop_table :students
  end
end
