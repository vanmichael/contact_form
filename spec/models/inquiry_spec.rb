require 'spec_helper'

describe Inquiry do


	describe "validations" do

	  it { should have_valid(:first_name).when('van') }
	  it { should_not have_valid(:first_name).when(nil,'') }

	  it { should have_valid(:last_name).when('nguyen') }
	  it { should_not have_valid(:last_name).when(nil,'') }

	  let(:blanks) { [nil, ''] }
	  it { should have_valid(:email).when('van@gmail.com') }
	  it { should_not have_valid(:email).when(*blanks) }

	  let(:invalid_emails) { ['blah.com','@blah.com','@@blah.com','blah','.com'] }
	  it { should_not have_valid(:email).when(*invalid_emails) }

	  it "should have a unique email" do
	  	inquiry_one = FactoryGirl.build(:inquiry)
	  	inquiry_two = FactoryGirl.build(:inquiry)

	  	expect(inquiry_one.save).to eq true
	  	expect(inquiry_two.save).to eq false
	  end

	  it { should have_valid(:subject).when('Sam is mean') }
	  it { should_not have_valid(:subject).when(nil,'') }

	  it { should have_valid(:description).when('Hello My friend') }
	  it { should_not have_valid(:description).when(nil,'') }
	end

end
