require 'rails_helper'

def login_user
  @user = User.create(
    name: 'sasuke',
    email: 'sasuke@gmail.com',
    password: 'password'
  )

  @category = Category.create(
    name: 'electronics',
    icon: '💻',
    user_id: @user.id
  )

  @expense = Expense.create(
    author_id: @user.id,
    name: 'laptop',
    amount: 1500
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

RSpec.describe 'categories index ' do
  before :each do
    login_user
  end

  it 'see the title in navbar ' do
    visit authenticated_root_path
    expect(page).to have_content('categories')
  end

  it 'see the category name ' do
    visit authenticated_root_path
    expect(page).to have_content(@category.name)
  end

  it 'see the purchase price for this category' do
    visit authenticated_root_path
    expect(page).to have_content(@expenses.sum(:amount))
  end

  it 'see the icon' do
    visit authenticated_root_path
    expect(page).to have_content(@category.icon)
  end

  it 'see the add category button ' do
    visit authenticated_root_path
    expect(page).to have_link('ADD CATEGORY')
  end

  it 'when click add category should go to the new page' do
    visit authenticated_root_path
    click_on 'ADD CATEGORY'
    expect(page).to have_content('Select an icon')
  end
end
