class TweetController < ApplicationController

  def index
    @tweet = Tweet.new
  end

end