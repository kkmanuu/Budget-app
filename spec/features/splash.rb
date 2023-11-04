require 'rails_helper'

RSpec.describe 'splash' do
  before :each do
    visit unauthenticated_root_path
  end

  it 'see the log in button' do
    expect(page).to have_content('LOG IN')
  end

  it ' see the sing up ' do
    expect(page).to have_content('SIGN UP')
  end
end
