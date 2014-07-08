class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :twitter_name
      t.string :tweets, :array => true
      t.string :selected_tweets, :array => true
    end
  end
end
