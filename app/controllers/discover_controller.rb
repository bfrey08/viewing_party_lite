class DiscoverController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    #@top_40 = TmdbFacade.create_top_rated_movies[0..39]
    #@search = TmdbFacade.create_search_movies(params[:search])
  end
end
