class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :user_id
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
