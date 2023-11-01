class Purchase < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  has_many :category_purchases
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :categories, through: :category_purchases
end
