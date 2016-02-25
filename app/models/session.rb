class Session < ActiveRecord::Base
  belongs_to :user
  before_create :create_url_key

  # validates :review_rating, presence: true
  # validates :review_title, presence: true
  # validates :review_content, presence: true


  def create_url_key
    self.url_key = SecureRandom.urlsafe_base64
  end
end