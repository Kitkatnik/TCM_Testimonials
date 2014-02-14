class CreateWebLinks < ActiveRecord::Migration
  def change
    create_table :web_links do |t|
      t.integer :user_id
      t.string :url
      t.string :title

      t.timestamps
    end
  end
end
