require 'spec_helper'

describe User do
  it { should validate_uniqueness_of :email }
  it { should validate_uniqueness_of :username }
  it { should have_many :leagues }

  describe 'username' do
    it { should allow_value('nat').for(:username) }
    it { should_not allow_value('as df jkl').for(:username) }
    it { should_not allow_value('nat?').for(:username) }
    it { should_not allow_value('nat=nat').for(:username) }
    it { should_not allow_value('nat%').for(:username) }
  end
end
