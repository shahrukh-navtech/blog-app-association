class SubscribersController < ApplicationController
	def index
		@subscibers = Subscriber.all

	end

	def new
		@magazines = Magazine.all
	end

	def create

		@subscriber = Subscriber.create(name: params[:subscribers][:name])

		params[:magazine_ids].each do |magazine_id| 

			@subscriber.magazines << Magazine.find_by(id: magazine_id)

		end

		redirect_to subscribers_path

	end

	def edit
		@subscriber = Subscriber.find(params[:id])
		@magazines = Magazine.all

	end

	def update

		@subscriber = Subscriber.find_by(id: params[:id])

		@subscriber.magazines.clear

		params[:magazine_ids].each do |magazine_id| 

			@subscriber.magazines << Magazine.find_by(id: magazine_id)

		end

		redirect_to subscriber_path(@subscriber)

	end

	def show

		@subscriber = Subscriber.find(params[:id])

		#binding.pry

		#puts @category.products

	end

	def destroy

		@subscriber = Subscriber.find(params[:id])

		@subscriber.destroy

		redirect_to subscribers_path

	end




end
