class User < ApplicationRecord
  validates :name, presence: true

  has_many :categories
  has_many :purchases
end
