require 'spec_helper'

feature "User creates an inquiry", %q{
	As a site visitor
	I want to contact the sites's staff
	So that I can tell them how awesome they are
} do

	# Acceptance Criteria:
	# * I mustspecify a valid email address
	# * I must specify a subject
	# * I must specify a description
	# * I must specify a first name
	# * I must specify a last name

	context "with valid attributes" do
		it "creates an inquiry with valid attributes" do
			visit '/inquiries/new'
			fill_in "First name", with: "van"
			fill_in "Last name", with: "nguyen"
			fill_in "Email", with: "van@gmail.com"
			fill_in "Subject", with: "ruby"
			fill_in "Description", with: "This is a help request"

			click_on "Create Inquiry"

			expect(page).to have_content "Inquiry Submitted"
		end
	end

	context "with invalid attributes" do
		it "displays errors for invalid attributes" do
			visit '/inquiries/new'
			click_on "Create Inquiry"

			expect(page).to have_content "First name can't be blank"
			expect(page).to have_content "Last name can't be blank"
			expect(page).to have_content "Email can't be blank"
			expect(page).to have_content "Email is invalid"
			expect(page).to have_content "Subject can't be blank"
			expect(page).to have_content "Description can't be blank"
		end
	end

end