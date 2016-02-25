class Session < ActiveRecord::Base
  belongs_to :user

  validates :review_rating, presence: true
  validates :review_title, presence: true
  validates :review_content, presence: true
end