require 'rails_helper'

RSpec.describe User, type: :model do

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:gender) }

    it 'should save successfully ' do
      user = build(:user).save
      expect(user).to eq(true)
    end

    it 'ensures name presence ' do
      user = build(:user, name: nil).save
      expect(user).to eq(false)
    end

    it 'ensures email presence ' do
      user = build(:user, email: nil).save
      expect(user).to eq(false)
    end

    it 'ensures gender presence ' do
      user = build(:user, gender: nil).save
      expect(user).to eq(false)
    end

  end

  describe "associations" do
    # it { should belong_to(:user ) }
    it { should have_many(:group_users ) }
    it { should have_many(:groups).through(:group_users) }
  end
end
