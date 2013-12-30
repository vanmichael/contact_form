require 'spec_helper'

feature "Admin deletes an inquiry", %q{
	As an Admin
	I want to review contact inquiries
	So that I can respond or take action
} do

	# Acceptance Criteria:
	# * I can see a list of all contact inquiries
	# * I can remove an item from the listing of contact inquiries

	context "delete inquiry" do
		it "deletes an inquiry" do
			FactoryGirl.create(:inquiry)

			visit '/inquiries'

			click_on "Delete"
			expect(page).to have_content "Inquiry Deleted"
		end
	end
end
