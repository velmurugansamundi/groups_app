require 'rails_helper'

RSpec.describe GroupUser, type: :model do
  it "has a valid factory" do
    expect(build(:group_user)).to be_valid
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:group_id) }
    it { is_expected.to validate_presence_of(:role_id) }

    it 'should save successfully ' do
      user = build(:group_user).save
      expect(user).to eq(true)
    end

    it 'ensures name presence ' do
      user = build(:group_user, user_id: nil).save
      expect(user).to eq(false)
    end

    it 'ensures email presence ' do
      user = build(:group_user, group_id: nil).save
      expect(user).to eq(false)
    end

    it 'ensures gender presence ' do
      user = build(:group_user, role_id: nil).save
      expect(user).to eq(false)
    end

  end

  describe "associations" do
    it { should belong_to(:role ) }
    it { should belong_to(:user ) }
    it { should belong_to(:group ) }
    end
end
