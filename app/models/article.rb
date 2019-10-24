class Article < ApplicationRecord
	#validates :title, presence: true, message
	validates_presence_of :title, message: 'Put some Title please'
	belongs_to :author
end
