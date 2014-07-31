class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :twitter_name1
      t.string :twitter_name2
      t.string :tweet_array1, :array => true
      t.string :tweet_array2, :array => true
      t.string :selected_tweets1, :array => true
      t.string :selected_tweets2, :array => true
      t.belongs_to :story
      t.timestamps
    end
  end
end
