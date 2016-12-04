class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  mount_uploader :image, ImageUploader
end
