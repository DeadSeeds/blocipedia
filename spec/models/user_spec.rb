require 'rails_helper'

RSpec.describe User, type: :model do
let(:user) { User.create!(name: "Username", email: "user@test.com", password: "password") }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }


end
