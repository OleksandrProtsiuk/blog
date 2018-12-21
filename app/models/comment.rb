class Comment < ActiveRecord::Base
  belongs_to :post, optional: true
  belongs_to :user, optional: true
  has_ancestry
  acts_as_tree

  validates :body, :presence => true
  validates :user, :presence => true

end
