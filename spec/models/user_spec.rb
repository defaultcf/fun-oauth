require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when create user' do
    it 'validate not fun.ac.jp' do
      user = User.new email: 'test@aizu.ac.jp', password: 'password'
      expect(user.valid?).to be false
      expect(user.errors[:email]).to include 'needs to be fun.ac.jp account'
    end
  end
end
