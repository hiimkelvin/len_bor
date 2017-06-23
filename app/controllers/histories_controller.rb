class HistoriesController < ApplicationController

    def create
        history = History.new( history_params )
        unless history.save
            flash[:errors] = history.errors.full_messages
        end
        redirect_to :back
    end

    def history_params
  	    params.require(:hist).permit(:amount, :borrower_id).merge(lender: current_lender)
        # params.require(:hist).permit(:amount)

    end
end
