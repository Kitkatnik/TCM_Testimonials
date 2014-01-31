class CreateUserTestimonials < ActiveRecord::Migration
  def change
    create_table :user_testimonials do |t|
      t.integer :user_id
      t.integer :recipient_id
      t.integer :testimonial_id

      t.timestamps
    end
  end
end
