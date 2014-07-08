require 'twitter_api'

class StoryController < ApplicationController
  include TwitterApi

  def index
  end

  def show
    genre = params["chosen_genre"].capitalize
    @chosen_story = Story.find_by_genre(genre)
    @first_tweets = get_tweets(params["user_name1"], 9)
    @second_tweets = get_tweets(params["user_name2"], 9)
  end
end
