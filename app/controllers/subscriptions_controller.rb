class SubscriptionsController < ApplicationController

	def index
		@subscribers = Subscriber.all
	end
	
end
