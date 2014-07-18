class AddContentToStory < ActiveRecord::Migration
  def change
    add_column :stories, :content, :text
  end
end
