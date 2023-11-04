require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'Expense model' do
    let(:user) { User.create(name: 'kiko', email: 'kiko@gmail.com') }

    it 'should have an integer author_id' do
      expense = Expense.new(author_id: user.id, name: 'apple', amount: 11)
      expense.author_id = nil
      expect(expense).to_not be_valid
    end

    it 'name should be presence' do
      expense = Expense.new(author_id: user.id, name: 'apple', amount: 11)
      expense.name = nil
      expect(expense).to_not be_valid
    end

    it 'amount should be greater than or equal to zero' do
      expense = Expense.new(author_id: user.id, name: 'apple', amount: 11)
      expense.amount = -1
      expect(expense).to_not be_valid
    end

    it 'category_ids should be present' do
      expense = Expense.new(author_id: user.id, name: 'apple', amount: 11)
      expense.category_ids = nil
      expect(expense).to_not be_valid
      expect(expense.errors[:category_ids]).to include('must be selected')
    end
  end
end
