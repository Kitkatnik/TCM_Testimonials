class PuttingRecipientIdInTestimonials < ActiveRecord::Migration
  def change
    remove_column :user_testimonials, :recipient_id
    add_column :testimonials, :recipient_id, :integer
  end
end
