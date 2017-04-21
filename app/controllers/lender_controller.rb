class LenderController < ApplicationController
  def create
    @lendcheck = Borrower.find_by_email(lender_params[:email])
    if @lendcheck
      flash[:errors] = ['You cant lend if you cant spend, baybeeeeeee']
      redirect_to :back
    else
      @lender = Lender.new(lender_params)
      if @lender.save
        session[:is_lender] = true
        session[:lender_id] = @lender.id
        redirect_to "/lender/#{@lender.id}"
      else
        flash[:errors] = @lender.errors.full_messages
        redirect_to :back
      end
    end
  end

  def show
    @borrowers = Borrower.all
    @lender = Lender.find(params[:id])
  end

  def update
    @borrower = Borrower.find(params[:id])
    @lender = Lender.find(session[:lender_id])
    @transaction = Transaction.new(lender: @lender, borrower: @borrower, transfer: params[:money])
  end

  private
    def lender_params
      params.require(:lender).permit(:first_name, :last_name, :email, :money, :password, :password_confirmation)
    end
end
