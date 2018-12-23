class Post < ApplicationRecord
  before_create :set_slug
  has_many :comments
  belongs_to :user, optional: true
  acts_as_taggable_on :tags

  scoped_search on: [:title, :body]

  def to_param
    slug
  end

  private

  def set_slug
    Post.last.slug = to_slug(title)
  end

end
