require 'rails_helper'
Rails::SourceAnnotationExtractor

RSpec.describe ArticlesController, type: :controller do
	fixtures :articles

	describe 'GET index' do
		it "should list all the articles" do
			get :index
			binding.pry
			expect(response).to include(Article.all)
	 end
	end
end
