module TwitterApi

  def self.included(base)
    base.include Twitter_helper
  end

  def get_tweets(twittername)
    strings = []
    tweets = self.make_client.user_timeline(twittername)
    self.process_tweets(tweets, strings)
  end

  module Twitter_helper
    def make_client
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['CONSUMER_KEY']
        config.consumer_secret     = ENV['CONSUMER_SECRET']
        config.access_token        = ENV['ACCESS_TOKEN']
        config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
      end
    end

    def process_tweets(tweets, strings)
      tweets.sample(9).each {|tweet| format_tweet(tweet, strings)}
      return strings
    end

    def format_tweet(tweet, strings)
      strings << call_tweet_removers(tweet)
    end

    def call_tweet_removers(tweet)
      formatted_tweet = remove_retweet(remove_punctuation(remove_url(tweet)))
    end

    def remove_url(tweet)
      remove_urls_hagtags = /(https?:\/\/)?([\da-zA-Z\.-]+)\.([a-zA-Z\.]{2,6})([\/\w\.-]*)*\/?|@\w+|#\w+/
      tweet.text.gsub(remove_urls_hagtags, "").strip
    end

    def remove_punctuation(tweet)
      remove_punctuations = /(\.|!|:|--|-)?$/
      tweet.gsub(remove_punctuations, "").strip
    end

    def remove_retweet(tweet)
      remove_rts = /(RT\s:)/
      tweet.gsub(remove_rts, "").strip
    end

  end
end




