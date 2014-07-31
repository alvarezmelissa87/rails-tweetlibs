class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.belongs_to :original_story
      t.timestamps
    end
  end
end
