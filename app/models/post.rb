class Post < ApplicationRecord
  has_many :comments
  belongs_to :user, optional: true
  acts_as_taggable_on :tags
  acts_as_commentable

end
