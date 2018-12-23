class Post < ApplicationRecord
  has_many :comments
  belongs_to :user, optional: true
  acts_as_taggable_on :tags

  scoped_search on: [:title, :body]

  def to_param
    slug
  end

end
