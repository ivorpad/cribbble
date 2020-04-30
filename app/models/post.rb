class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user
  has_one_attached :image
  acts_as_taggable_on :tags

  # include ActsAsTaggableOn::Taggable::Related::ClassMethods

  # def related_tags_for(context, klass, options = {})
  #   tags_to_ignore = Array.wrap(options[:ignore]).map(&:to_s) || []
  #   tags_to_find = tags_on(context).map { |t| t.name }.reject { |t| tags_to_ignore.include? t }
  #   exclude = exclude_self(klass, id) if options[:exclude].present?
  #   related_where(klass, ["#{exclude} #{klass.table_name}.#{klass.primary_key} = #{ActsAsTaggableOn::Tagging.table_name}.taggable_id AND #{ActsAsTaggableOn::Tagging.table_name}.taggable_type = '#{klass.base_class}' AND #{ActsAsTaggableOn::Tagging.table_name}.tag_id = #{ActsAsTaggableOn::Tag.table_name}.#{ActsAsTaggableOn::Tag.primary_key} AND #{ActsAsTaggableOn::Tag.table_name}.name IN (?) AND #{ActsAsTaggableOn::Tagging.table_name}.context = ?", tags_to_find, context])
  # end

  scope :with_tags, -> (tags) {tagged_with(tags, :any => true)}
end
