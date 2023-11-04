class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_expenses
  has_many :categories, through: :category_expenses

  validates :amount, numericality: { greater_than: 0 }
  validates :name, presence: true

  validates :category_ids, presence: { message: 'must be selected' }
end
