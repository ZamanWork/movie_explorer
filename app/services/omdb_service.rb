# app/services/omdb_service.rb

class OmdbService
  include HTTParty
  base_uri 'http://www.omdbapi.com/'

  def self.search_movie_by_title(title)
    api_key = '7dbd783c' # Replace with your actual OMDB API key
    response = get("/?apikey=#{api_key}&t=#{title}")

    if response.success?
      JSON.parse(response.body)
    else
      nil
    end
  end
end
