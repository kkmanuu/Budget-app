require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model ' do
    subject { User.new(name: 'Emmanuel', email: 'kipngenoemmanuel479@gmail.com') }

    before { subject.save }

    it ' name must not be blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it ' name must be at least two and not greater than 50' do
      subject.name = 'a' * 250
      expect(subject).to_not be_valid
    end
  end
end
