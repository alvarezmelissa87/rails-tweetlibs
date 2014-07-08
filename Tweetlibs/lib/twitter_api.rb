
module TwitterApi


  def get_tweets(twittername, num_of_tweets)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end

    strings = []
    tweets = client.user_timeline(twittername)
    raise ArgumentError, 'Please input Twitter handle with at least 10 tweets.' unless tweets.length >= 10

    tweets.sample(num_of_tweets).each do |tweet|
      remove_urls_hagtags = /(https?:\/\/)?([\da-zA-Z\.-]+)\.([a-zA-Z\.]{2,6})([\/\w\.-]*)*\/?|@\w+|#\w+/
      remove_punctuations = /(\.|!|:|--|-)?$/
      urls_removed = tweet.text.gsub(remove_urls_hagtags, "").strip
      punc_removed = urls_removed.gsub(remove_punctuations, "").strip
      strings << punc_removed if punc_removed.length > 2
    end

    strings
  end
end




