class CreateGuests < ActiveRecord::Migration
  def self.up
    create_table :guests do |t|
      t.column :name,           :string
      t.column :signed_in_at,   :datetime
      t.column :signed_out_at,  :datetime
      t.column :parent_id,      :integer
      t.column :has_form,       :boolean
    end
  end

  def self.down
    drop_table :guests
  end
end
