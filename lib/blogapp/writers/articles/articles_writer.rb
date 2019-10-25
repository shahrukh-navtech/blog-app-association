module Blogapp
  module Writers
    module Articles
      class ArticleWriter
        require 'async'

        def single(resource)
          return "#{Article.pluck @cols}"
        end


      end
    end
  end
end