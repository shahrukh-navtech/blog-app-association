module Blogapp
  module Writers
    module Articles
      class ArticlesWriter

        def single(resource)
          return Article.find(resource)
        end

        def single_col(resource)
          binding.pry
          return Article.pluck(resource)
          #return Article.pluck(resource.to_sym)
        end


      end
    end
  end
end