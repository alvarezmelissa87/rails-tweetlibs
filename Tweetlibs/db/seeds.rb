# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


def read_in_story_file(file_path) #file_path should be a string
  file = File.new(file_path)
  story_array = file.readlines
  p title = story_array[0].chomp
  p genre = story_array[1].chomp
  p story = story_array.slice(3,story_array.length)
  Original_story.create(:title => title, :genre => genre, :content => story.join(""))
end

read_in_story_file("/Users/Melissa/Desktop/rails/rails-tweetlibs/Tweetlibs/db/horror_story.html.erb")
read_in_story_file('/Users/Melissa/Desktop/rails/rails-tweetlibs/Tweetlibs/db/romance.txt')
read_in_story_file('/Users/Melissa/Desktop/rails/rails-tweetlibs/Tweetlibs/db/spaceopera1.txt')
