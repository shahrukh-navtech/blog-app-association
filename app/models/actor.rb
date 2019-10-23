class Actor < ApplicationRecord
  has_many :comments, as: :commentable
end
