class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    #binding.pry
  end

  def show
    @movie = Movie.find(params[:id])
    #binding.pry
  end

  def edit
  	@movie = Movie.find(params[:id])

  	# binding.pry
  end

  def update
  	@movie = Movie.find(params[:id])
  	@movie.update(name: params[:movie][:name])
  	@movie.update(description: params[:movie][:description])
  	
  	redirect_to movies_path
  end

  def create
  	Movie.create(name: params[:movies][:name],description: params[:movies][:description])

  	redirect_to movies_path
  end

  def destroy
    Movie.find(params[:id]).destroy
    redirect_to movies_path
  end
end
