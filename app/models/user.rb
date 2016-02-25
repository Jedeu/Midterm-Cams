class User < ActiveRecord::Base
  has_many :sessions
  has_many :categories, :through => :category_types
  
  belongs_to :teacher, class_name: 'User', foreign_key: :teacher_id

  validates :name, presence: true, uniqueness: true, length: {minimum: 3, maximum: 15}
  validates :password, presence: true
end