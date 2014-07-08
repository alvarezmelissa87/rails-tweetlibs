class StoryController < ApplicationController

  def index
  end

  def show
    @chosen_story = Story.find(1)
    @first_tweets = params[:user_name1]
    @second_tweets = params[:user_name2]
  end
end
