module Blogapp
  module Writers
    module Authors
      class AuthorsWriter

      	def all
      		return Author.all
      	end

        def single(resource)
          @article = Author.find(resource)
          rescue StandardError => e
            return e.message
        end

        def single_col(resource)
          return "#{Article.pluck resource}"
        end

        def add_record(params)
          @author = Author.new(author_params(params))
          return @author.save ? @author : @author.errors
        end

        def update_record(params)
          @author = Author.find(params[:id])
          return @author.update(author_params(params)) ? @author : @author.errors
        end

        private
          def author_params(params)
            params.require(:author).permit(:first_name, :last_name, :phone)
          end

      end
    end
  end
end