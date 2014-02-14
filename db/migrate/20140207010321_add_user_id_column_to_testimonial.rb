class AddUserIdColumnToTestimonial < ActiveRecord::Migration
  def change
    add_column :testimonials, :user_id, :integer
  end
end
