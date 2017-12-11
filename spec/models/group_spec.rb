require 'rails_helper'

RSpec.describe Group, type: :model do
  it "has a valid factory" do
    expect(build(:group)).to be_valid
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }

    it 'should save successfully ' do
      group = build(:group).save
      expect(group).to eq(true)
    end

    it 'ensures name presence ' do
      group = build(:group, name: nil).save
      expect(group).to eq(false)
    end
  end

  describe "associations" do
    # it { should belong_to(:user ) }
    it { should have_many(:group_users ) }
    it { should have_many(:users).through(:group_users) }
  end
end
