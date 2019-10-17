class Author < ApplicationRecord
	validates :first_name, presence: true
	validates :phone, numericality: { only_integer: 10 }, length: { is: 10 }
	has_many :articles, dependent: :destroy
end
