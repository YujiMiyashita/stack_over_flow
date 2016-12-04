class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  mount_uploader :image, ImageUploader
end
