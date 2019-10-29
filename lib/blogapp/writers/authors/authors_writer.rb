module Blogapp
  module Writers
    module Authors
      class AuthorsWriter

      	def all
      		return Author.all
      	end

        def single(resource)
          return Author.find(resource)
        end

        def single_col(resource)
          return "#{Article.pluck resource}"
        end


      end
    end
  end
end