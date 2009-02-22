class CreateLineItems < ActiveRecord::Migration
  def self.up
    create_table :line_items do |t|
      t.column :student_id,     :integer,   :null => false
      t.column :guest_id,       :integer,   :null => false
      t.column :signed_in_at,   :datetime
      t.column :signed_out_at,  :datetime
    end
    
    execute "alter table line_items add constraint fk_line_item_students
              foreign key (student_id) references students(id)"
    
    execute "alter table line_items add constraint fk_line_item_guests
              foreign key (guest_id) references guests(id)"
    
  end

  def self.down
    drop_table :line_items
  end
end
