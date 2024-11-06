class Post < ApplicationRecord
  validates_presence_of :title
  has_rich_text :content
  has_many :post_comments, dependent: :destroy
end
