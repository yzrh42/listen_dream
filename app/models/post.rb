class Post < ApplicationRecord
    belongs_to :user

    validates :text, presence: true, length: { maximum: 65_535 }
    validates :date, presence: true
  end