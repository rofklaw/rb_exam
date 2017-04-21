class BorrowerController < ApplicationController
  def create
    @spendcheck = Lender.find_by_email(borrower_params[:email])
      if @spendcheck
        flash[:errors] = ['You cant spend if you cant lend, duuuuuuude']
        redirect_to :back
      else
      @borrower = Borrower.new(borrower_params)
      if @borrower.save
        session[:is_borrower] = true
        session[:borrower_id] = @borrower.id
        redirect_to "/borrower/#{@borrower.id}"
      else
        flash[:errors] = @borrower.errors.full_messages
        redirect_to :back
      end
    end
  end

  def show
    @borrower = Borrower.find(params[:id])
  end

  private
    def borrower_params
      params.require(:borrower).permit(:first_name, :last_name, :email, :need, :description, :goal, :password, :password_confirmation)
    end
end
