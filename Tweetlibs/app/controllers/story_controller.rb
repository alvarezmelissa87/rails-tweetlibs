class StoryController < ApplicationController

  def index
  end

  def show
    genre = params["chosen_genre"].capitalize
    @chosen_story = Story.find_by_genre(genre)
    @first_tweets = params[:user_name1]
    @second_tweets = params[:user_name2]
  end
end
