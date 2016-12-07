class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :votes, dependent: :destroy
  mount_uploader :image, ImageUploader
end
