# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "json"
require "open-uri"

pages = (1..500).to_a

pages.each_with_index do |page, i|
  p "Getting movies from page #{i + 1}"
  url = "https://api.themoviedb.org/3/movie/top_rated?api_key=854a35589ffa7bd74416b849a8ab8f11&language=en-US&page=#{page}"
  movies_serialized = URI.open(url).read
  movies = JSON.parse(movies_serialized)
  movies["results"].each do |result|
    Movie.create(title: result["title"], overview: result["overview"], poster_url: "https://image.tmdb.org/t/p/w300#{result['poster_path']}", rating: result["vote_average"])
  end
  p "Finished"
end
