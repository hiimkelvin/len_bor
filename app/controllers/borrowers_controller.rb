class BorrowersController < ApplicationController
    def show
        @borrower = Borrower.find(params[:id])
    end

    def create
        @borrower = Borrower.new( borrower_params )
        @borrower.raised = 0
        if @borrower.save
            redirect_to '/sessions/new'
        else
            flash[:errors] = @borrower.errors.full_messages
            redirect_to :back
        end
    end

    def borrower_params
  	  params.require(:borrower).permit(:first_name, :last_name, :email, :password, :password_confirmation, :money, :purpose, :description)
    end

end
