class InquiriesController < ApplicationController
	before_action :set_inquiry, only: [:show, :destroy]

	def index
		@inquiries = Inquiry.all
	end

	def new
		@inquiry = Inquiry.new
	end

	def create
		@inquiry = Inquiry.new(inquiry_params)

		if @inquiry.save
			flash["alert-box success radius"] = "Inquiry Submitted"
			redirect_to @inquiry
		else
			flash["alert-box"] = "Inquiry not Submitted"
			render 'new'
		end
	end

	def show

	end

	def destroy
		@inquiry.destroy
		redirect_to inquiries_path
	end

	private

	def set_inquiry
		@inquiry = Inquiry.find(params[:id])
	end

	def inquiry_params
		params.require(:inquiry).permit(:first_name, :last_name, :email, :subject, :description)
	end

end