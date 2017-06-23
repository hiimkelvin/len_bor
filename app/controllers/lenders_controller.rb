class LendersController < ApplicationController

    def create
        @lender = Lender.new( lender_params )
        if @lender.save
            redirect_to '/sessions/new'
        else
            flash[:errors] = @lender.errors.full_messages
            redirect_to :back
        end
    end

    def show
        @lender = Lender.find(session[:user_id])
        @borrower = Borrower.all
        @our_borrowers = Lender.find(session[:user_id]).histories
    end

    def lender_params
  	  params.require(:lender).permit(:first_name, :last_name, :email, :password, :password_confirmation, :money)
    end

end
