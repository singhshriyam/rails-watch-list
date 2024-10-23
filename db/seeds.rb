require 'open-uri'
require 'json'

def fetch_movies
  url = 'https://tmdb.lewagon.com/movie/top_rated'
  JSON.parse(URI.open(url).read)['results']
end

puts 'Seeding movies...'
movies = fetch_movies

movies.each do |movie_data|
  Movie.create!(
    title: movie_data['original_title'],
    overview: movie_data['overview'],
    poster_url: movie_data['poster_path'],
    rating: movie_data['vote_average']
  )
end

puts 'Finished seeding movies!'
