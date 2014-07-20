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
    @tweets = Tweet.find_by_story_id(@story.id)
    update_story_content
  end

  def delete

  end

  private

  def story_params
    params.require(:story).permit(:genre)
  end

  def update_story_content
    my_story = build_story(@o_story, @tweets)
    @story.update_attributes(content: my_story)
  end

  def build_story(story, tweets)
    user1_replace = { user1_1: "#{tweets.selected_tweets1[0]}", user1_2: "#{tweets.selected_tweets1[1]}", user1_3: "#{tweets.selected_tweets1[2]}" }
    user2_replace = { user2_1: "#{tweets.selected_tweets2[0]}", user2_2: "#{tweets.selected_tweets2[1]}", user2_3: "#{tweets.selected_tweets2[2]}" }
    user1_replace.each { |key,value| story.content.sub!(key.to_s, value) }
    user2_replace.each { |key,value| story.content.sub!(key.to_s, value) }
    story.content
  end
end
