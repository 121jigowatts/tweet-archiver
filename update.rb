require './config'
require './archiver'

TAGS.each do |tag|
  archiver = TweetArchiver.new(tag)
  archiver.update
end