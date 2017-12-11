require 'rails_helper'

# Shared Examples written same method we are testing into the different places
RSpec.shared_examples "calling create_group_with_users method" do |parameter1, parameter2|

  context "when passing extra params" do
    it "should raise an ArgumentError error if one parameters passed" do
      expect { GroupManager.create_group_with_users() }.to raise_error(ArgumentError)
    end

    it "should raise an ArgumentError error if more than one  parameters passed" do
      expect { GroupManager.create_group_with_users(parameter1, parameter2) }.to raise_error(ArgumentError)
    end
  end
end


# Shared Examples written same method we are testing into the different places
RSpec.shared_examples "calling update_groups_info method" do |parameter1, parameter2|

  context "when passing extra params" do
    it "should raise an ArgumentError error if one parameters passed" do
      expect { GroupManager.update_groups_info() }.to raise_error(ArgumentError)
    end

    it "should raise an ArgumentError error if more than one  parameters passed" do
      expect { GroupManager.update_groups_info(parameter1, parameter2) }.to raise_error(ArgumentError)
    end
  end
end

RSpec.describe GroupdManager  do

  describe '.create_group_with_users' do
    # Calling the Shared Examples
    include_examples "calling create_group_with_users method", "parameter1", "parameter2"
  end

  describe '.update_groups_info' do
    # Calling the Shared Examples
    include_examples "calling update_groups_info method", "parameter1", "parameter2"
  end

end