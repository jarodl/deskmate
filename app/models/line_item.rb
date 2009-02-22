class LineItem < ActiveRecord::Base
  belongs_to :student
  belongs_to :guest
  
  def self.from_new_item(new_item)
    li = self.new
    li.student_id = new_item.student_id
    li.guest_id = new_item.guest_id
    li.signed_in_at = new_item.signed_in_at
    li.signed_out_at = new_item.signed_out_at
    li
  end
  
end
