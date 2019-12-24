class Article < ApplicationRecord
	validates_presence_of :title, message: 'must exist'
	validates_presence_of :body, message: 'must exist'
	# belongs_to :author
	belongs_to :user
end
