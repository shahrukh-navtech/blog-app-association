class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    #binding.pry
  end

  def show
    @movie = Movie.find(params[:id])


    #binding.pry
  end
end
