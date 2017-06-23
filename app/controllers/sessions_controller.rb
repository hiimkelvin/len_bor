class SessionsController < ApplicationController

  def create
    # @lender = Lender.find_by_email(params[:email])
    # @borrower = Borrower.find_by_email(params[:email]) 
    # if  @lender == @borrower
    #     flash[:errors] = ["Cannot sign up for 2 accounts!"]
    #     redirect_to '/sessions/new'
    # else
        @lender = Lender.find_by_email(params[:email])
        if @lender && @lender.authenticate(params[:password])
            session[:user_id] = @lender.id
            redirect_to "/lenders/#{@lender.id}"
        elsif 
            @borrower = Borrower.find_by_email(params[:email]) 
            if @borrower && @borrower.authenticate(params[:password])
                session[:user_id] = @borrower.id
                redirect_to "/borrowers/#{@borrower.id}"
            else
                flash[:errors] = ["Invalid Combination"]
                redirect_to '/sessions/new'
            end    
        else 
            flash[:errors] = ["Invalid Combination"]
            redirect_to '/sessions/new'
        end
    # end
  end

  def destroy
    reset_session
    redirect_to :root
  end

end
