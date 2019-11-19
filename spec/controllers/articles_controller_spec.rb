require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
	fixtures :articles, :authors

	describe '#index' do
		it "should list all the articles" do
			binding.pry
			get :index


	 end
	end
end
