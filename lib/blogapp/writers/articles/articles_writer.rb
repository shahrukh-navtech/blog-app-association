module Blogapp
  module Writers
    module Articles
      class ArticlesWriter

        def all
          return Article.all
        end

        def single(resource)
          return Article.find(resource)
        end

        def single_col(resource)
          return Article.pluck(resource)
          #return Article.pluck(resource.to_sym)
        end
      end
    end
  end
end