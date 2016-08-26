require 'rubygems'
require 'mongo'
require 'twitter'

require './config'

class TweetArchiver

  def initialize(tag)
    db = Mongo::Client.new(CONNECTION_STRING)
    @tweet = db[COLLECTION_NAME]

    @tweet.indexes.create_many([
      {:key => {id: 1}, unique: true},
      {:key => {tags: 1,id: -1}}
    ])

    @tag = tag
    @tweet_found = 0
  end

  def update
    puts "Starting Twitter search for '#{@tag}'..."
    save_tweets_for(@tag)
    print "#{@tweet_found} tweets saved.\n\n"
  end

  def save_tweets_for(term)
    twitter_client = Twitter::REST::Client.new do |config|
      config.consumer_key        = CONSUMER_KEY
      config.consumer_secret     = CONSUMER_SECRET
      config.access_token        = ACCESS_TOKEN
      config.access_token_secret = ACCESS_TOKEN_SECRET
    end

    twitter_client.search(term).each do |tweet|
      @tweet_found += 1
      tweet_with_tag = tweet.to_hash.merge!({"tags" => [term]})
      @tweet.insert_one(tweet_with_tag)
    end

  end

end