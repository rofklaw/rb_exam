class SessionController < ApplicationController
  def new
	end

	def create
		  @lender = Lender.find_by_email(params[:email])
		  if @lender && @lender.authenticate(params[:password])
           session[:is_lender] = true
			     session[:lender_id] = @lender.id
			     redirect_to "/lender/#{@lender.id}"

      else
      @borrower = Borrower.find_by_email(params[:email])
      if @borrower && @borrower.authenticate(params[:password])
           session[:is_borrower] = true
			     session[:borrower_id] = @borrower.id
			     redirect_to "/borrower/#{@borrower.id}"
		  else
			     flash[:errors] = ["Invalid Login"]
			     redirect_to :back
      end
    end

	end

	def destroy
		session[:lender_id] = nil
    session[:borrower_id] = nil
    session[:is_lender] = nil
    session[:is_borrower] = nil
		redirect_to '/session/new'
	end
end
