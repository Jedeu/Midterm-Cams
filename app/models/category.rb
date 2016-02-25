class Category < ActiveRecord::Base
  has_many :users
  has_many :categorytypes :through => :users
end