module Blogapp
  module Writers
    module Articles
      class AuthorWriter

        def find_author(resource)
          return Article.find(resource).author
        end

        def single_col(resource)
          return "#{Article.pluck resource}"
        end


      end
    end
  end
end