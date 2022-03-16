class User < ApplicationRecord
  has_secure_password
  has_and_belongs_to_many :preferences
  has_many :videos
end
