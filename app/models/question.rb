class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :votes, dependent: :destroy
  mount_uploader :image, ImageUploader
  has_many :question_tags
  has_many :tags, through: :question_tags
  acts_as_ordered_taggable_on :tags
end
