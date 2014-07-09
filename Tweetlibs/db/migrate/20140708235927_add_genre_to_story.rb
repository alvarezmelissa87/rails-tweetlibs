class AddGenreToStory < ActiveRecord::Migration
  def change
    add_column :stories, :genre, :string
  end
end
