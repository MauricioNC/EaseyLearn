class Category < ApplicationRecord
  belongs_to :preference, optional: true
  has_many :events
  has_many :videos
end
