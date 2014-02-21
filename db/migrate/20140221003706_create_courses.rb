class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.date :date
      t.string :code

      t.timestamps
    end
  end
end
