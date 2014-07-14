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
    @story = Story.find(params[:id])
    @o_story = Original_story.find(@story.original_story_id)
  end

  private

  def story_params
    params.require(:story).permit(:genre)
  end
end
