class CategorizationController < ApplicationController
	
	def index
		@categories = Category.all
	end

end
