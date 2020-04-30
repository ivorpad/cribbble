class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user
  has_one_attached :image
  acts_as_taggable_on :tags

  scope :with_tags, -> (tags) {tagged_with(tags, :any => true)}
end
