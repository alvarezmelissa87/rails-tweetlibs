class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :genre
      t.text :content
      t.timestamps
    end
  end
end
