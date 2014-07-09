class TweetController < ApplicationController
  include TwitterApi

  def index
    @tweet = Tweet.new
  end

  def create
    #get tweets for username 1
    #get tweets for username 2
    #check that those were valid twitter calls
    #if yes save the tweet objact and redirect to #show
    #else redirect to index
    @story = Story.find(tweet_params[:story_id])
    if make_tweet_object.save
      redirect_to story_tweet_path(@story, @tweet)
    else
      render 'index'
    end
  end

  def show
  end

  private

  def tweet_params
    params.require(:tweet).permit(:story_id, :twitter_name1, :twitter_name2, :tweet_array1, :tweet_array2, :selected_tweets1, :selected_tweets2)
  end

  def make_tweet_object
    @tweet = Tweet.new(story_id: tweet_params[:story_id],
      twitter_name1: tweet_params[:twitter_name1],
      twitter_name2: tweet_params[:twitter_name2],
      tweet_array1: get_tweets(tweet_params[:twitter_name1]), 
      tweet_array2: get_tweets(tweet_params[:twitter_name2]))
  end
end