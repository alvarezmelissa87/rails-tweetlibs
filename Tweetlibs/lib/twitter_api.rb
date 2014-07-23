module TwitterApi

  def get_tweets(twittername)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end

    strings = []
    tweets = client.user_timeline(twittername)

    tweets.sample(9).each do |tweet|
      remove_urls_hagtags = /(https?:\/\/)?([\da-zA-Z\.-]+)\.([a-zA-Z\.]{2,6})([\/\w\.-]*)*\/?|@\w+|#\w+/
      remove_punctuations = /(\.|!|:|--|-)?$/
      remove_retweets = /(RT\s:)/
      urls_removed = tweet.text.gsub(remove_urls_hagtags, "").strip
      p punc_removed = urls_removed.gsub(remove_punctuations, "").strip
      p rts_removed = punc_removed.gsub(remove_retweets, "").strip
      strings << rts_removed if rts_removed.length > 2
    end

    strings
  end
end




