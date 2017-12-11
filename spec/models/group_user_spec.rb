require 'rails_helper'

RSpec.describe GroupUser, type: :model do

  context 'validations' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:group_id) }
    it { is_expected.to validate_presence_of(:role_id) }

    it 'ensures user_id presence ' do
      user = build(:group_user, user_id: nil).save
      expect(user).to eq(false)
    end

    it 'ensures group_id presence ' do
      user = build(:group_user, group_id: nil).save
      expect(user).to eq(false)
    end

    it 'ensures role_id presence ' do
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
