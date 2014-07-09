require 'twitter_api'

class StoryController < ApplicationController
  include TwitterApi

  def index
    @story = Story.new
  end

  def create
    @story = Story.create(story_params)
    @story.update_attributes(original_story_id: Original_story.find_by_genre(@story.genre).id)
    redirect_to story_tweet_index_path(@story)
  end

  def show
    genre = params["chosen_genre"].capitalize
    @chosen_story = Story.find_by_genre(genre)
    @first_tweets = get_tweets(params["user_name1"], 9)
    @second_tweets = get_tweets(params["user_name2"], 9)
  end

  private

  def story_params
    params.require(:story).permit(:genre)
  end
end
