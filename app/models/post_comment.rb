class PostComment < ApplicationRecord
  validates_presence_of :content
  belongs_to :post
  broadcasts_to :post
end
