require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(name: 'kiko', email: 'kiko@gmail.com') }

  it 'should have an integer user_id' do
    category = Category.new(user_id: user.id, name: 'food', icon: 'icon')
    category.user_id = nil
    expect(category).to_not be_valid
  end

  it 'name should be presence ' do
    category = Category.new(user_id: user.id, name: 'food', icon: 'icon')
    category.name = nil
    expect(category).to_not be_valid
  end

  it 'icon should be presence ' do
    category = Category.new(user_id: user.id, name: 'food', icon: 'icon')
    category.icon = nil
    expect(category).to_not be_valid
  end
end
