class TweetController < ApplicationController
  include TwitterApi

  def index
    @tweet = Tweet.new
  end

  def create
    @story = Story.find(tweet_params[:story_id])
    if make_tweet_object.save
      redirect_to story_tweet_path(@story, @tweet)
    else
      redirect_to story_tweet_index_path(@story)
    end
  end

  def show
    @story = Story.find(params[:story_id])
    @tweets = Tweet.find(params[:id])
    respond_to do |format|
      respond_to :html {render 'show'}
    end
  end

  def update
    @tweets = Tweet.find(params[:id])
    selection1 = [params['selected'][:st1_1], params['selected'][:st1_2], params['selected'][:st1_3]]
    selection2 = [params['selected'][:st2_1], params['selected'][:st2_2], params['selected'][:st2_3]]
    @tweets.update_attributes(selected_tweets1: selection1, selected_tweets2: selection2)
    redirect_to story_path(Story.find(params[:story_id]))
  end

  private

  def tweet_params
    params.require(:tweet).permit(:story_id, :twitter_name1, :twitter_name2, :tweet_array1, :tweet_array2, :selected_tweets1 => [], :selected_tweets2 => [])
  end

  def make_tweet_object
    @tweet = Tweet.new(story_id: tweet_params[:story_id],
      twitter_name1: tweet_params[:twitter_name1],
      twitter_name2: tweet_params[:twitter_name2],
      tweet_array1: get_tweets(tweet_params[:twitter_name1]),
      tweet_array2: get_tweets(tweet_params[:twitter_name2]))
  end
end
