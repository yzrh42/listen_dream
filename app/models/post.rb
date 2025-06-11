class Post < ApplicationRecord
    belongs_to :user

    validates :body, presence: true, length: { maximum: 65_535 }
    validates :date, presence: true

    mount_uploader :image, ImageUploader
  end