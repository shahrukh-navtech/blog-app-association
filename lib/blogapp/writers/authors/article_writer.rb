module Blogapp
  module Writers
    module Authors
      class ArticleWriter

        def find_article(resource)
          return Author.find(resource).articles
        end
      end
    end
  end
end