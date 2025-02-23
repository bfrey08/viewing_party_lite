class TmdbFacade
  def self.create_top_rated_movies
    # Rails.cache.fetch('top_rated_movies', :expires => 4.hour) do
      json = TmdbService.top_rated_movies
      json.map do |data|
        Movie.new(data)
      end
    # end
  end

  def self.movie_details(id)
    # Rails.cache.fetch('movie_details', :expires => 4.hour) do
      json = TmdbService.movie_details(id)
      movie = Movie.new(json)
      movie.add_details(json)
      json = TmdbService.movie_credits(id)
      movie.add_cast(json)
      movie
  # end
  end

  def self.create_search_movies(search)
    # Rails.cache.fetch('search_movies', :expires => 4.hour) do
      json = TmdbService.search_movies(search)
      json.map do |data|
        Movie.new(data)
      end
    # end
  end

  def self.create_reviews(movie_id)
    # Rails.cache.fetch('review', :expires => 4.hour) do
      json = TmdbService.reviews(movie_id)
    
      json[:results].map do |data|
        Review.new(movie_id, data)
      end
    # end
  end
end
