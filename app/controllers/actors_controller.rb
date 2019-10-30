class ActorsController < ApplicationController
	
  def index
    @actors = Actor.all
  end

  def show
    @actor = Actor.find(params[:id])
  end

  def edit
  	@actor = Actor.find(params[:id])
  end

  def update
  	@actor = Actor.find(params[:id])
  	@actor.update(name: params[:actor][:name])
  	@actor.update(description: params[:actor][:description])
  	redirect_to actors_path
  end

  def create
  	Actor.create(name: params[:actors][:name],description: params[:actors][:description])
  	redirect_to actors_path
  end

  def destroy
    Actor.find(params[:id]).destroy
    redirect_to actors_path
  end

end
