require 'rails_helper'
RSpec.describe FetchUserFromToken do
  context 'when data is invalid' do
    it 'Raise error when empty data is passed' do
      expect { described_class.new(nil).call }.to raise_error(FetchUserFromToken::MissingAuthHeader)
    end

    it 'raise error when token is invalid' do
      expect { described_class.new('blabla').call }.to raise_error(FetchUserFromToken::InvalidToken)
    end
  end

  context 'when token is valid' do
    let(:user) { User.new(id: 1) }

    it 'return user object' do
      token = 'valid_token'
      allow(JsonWebToken).to receive(:decode).and_return('user_id' => 1)
      allow(JsonWebToken).to receive(:valid_payload).and_return true
      expect(described_class.new(token).call).to be_eql(user)
    end
  end
end
