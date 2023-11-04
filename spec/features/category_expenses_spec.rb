require 'rails_helper'
def login_user
  @user = User.create(
    name: 'sasuke',
    email: 'sasuke@gmail.com',
    password: 'password'
  )

  @category = Category.create(
    name: 'electronics',
    icon: 'icon',
    user_id: @user.id
  )

  @expense = Expense.create(
    author_id: @user.id,
    name: 'laptop',
    amount: 1500,
    created_at: Time.current
  )

  @category_expense = CategoryExpense.create(
    category_id: @category.id,
    expense_id: @expense.id
  )

  @expenses = Expense.all

  visit new_user_session_path
  fill_in 'user_email', with: 'sasuke@gmail.com'
  fill_in 'user_password', with: 'password'
  click_button 'Log in'
end

RSpec.describe 'expenses index page' do
  before :each do
    login_user
  end

  it 'displays the page title and back link' do
    visit category_expenses_path(category_id: @category.id)
    expect(page).to have_content('Expenses')
  end

  it 'displays each expense with correct information' do
    visit category_expenses_path(category_id: @category.id)
    @expenses.each do |expense|
      expect(page).to have_content(expense.name)
      expect(page).to have_content(format('%.2f', expense.amount))
      expect(page).to have_content(expense.created_at.strftime('%d-%m-%Y'))
      expect(page).to have_selector(".card-footer .btn[data-method='delete'][href='#{category_expense_path(@category,
                                                                                                           expense)}']")
    end
  end

  context 'when no expenses are present' do
    it 'displays a message for no expenses' do
      category_without_expenses = Category.create(name: 'empty_category', icon: '💻', user_id: @user.id)
      visit category_expenses_path(category_id: category_without_expenses.id)
      expect(page).to have_content('There is no expense for this category')
    end
  end

  it 'displays "ADD EXPENSE" link' do
    visit category_expenses_path(category_id: @category.id)
    expect(page).to have_link('ADD EXPENSE', href: new_category_expense_path(category_id: @category.id))
  end
end
