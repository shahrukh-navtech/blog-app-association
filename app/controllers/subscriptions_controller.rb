class SubscriptionsController < ApplicationController
	def index
	
		@subscribers = Subscriber.all

		puts @subscribers

	end
end
