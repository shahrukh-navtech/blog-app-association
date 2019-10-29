module Blogapp
  module Writers
    module Articles
      class ArticlesWriter

        def single(resource)
          return Article.find(resource)
        end

        def single_col(resource)
          return "#{Article.pluck resource}"
        end


      end
    end
  end
end