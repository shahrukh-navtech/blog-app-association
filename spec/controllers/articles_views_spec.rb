require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
	fixtures :articles, :users
	render_views

	describe 'GET index' do

		it "responds in html" do
			get :index
			binding.pry
			expect(response).to render_template("index")
			
			expect(response.content_type).to eq "text/html; charset=utf-8"

	 end
	end
end
