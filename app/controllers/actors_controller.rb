class ActorsController < ApplicationController
  def index
    @actors = Actor.all
    #binding.pry
  end

  def show
    @actor = Actor.find(params[:id])


    #binding.pry
  end


end
