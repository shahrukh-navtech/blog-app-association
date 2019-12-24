module Blogapp
  module Writers
    module Articles
      class ArticlesWriter

        def all
          @articles = Article.all
          return @articles
        end

        def single(resource)
          return Article.find(resource)
        end

        def create(resource)
          # binding.pry
          puts resource
          @article = Article.new(resource)
          @article.user = User.find(13)
          if @article.save
            return true
          else
            # flash[:notice] = []
            # @article.errors.full_messages.each { |msg| flash[:notice] << msg }
            return false
          end
        end

        private

        # def article_params
        #   resource.require(:article).permit(:title, :body, :url)
        # end

      end
    end
  end
end