class RequestResponsesController < ApplicationController

    def show
    end

    def new
        @respond = RequestResponse.new
        @supporter_id = session[:user]
        @request = FinancialRequest.find(params[:request_id])
    end

      def create
        @request = FinancialRequest.find(response_params[:request_id])
        @respond = RequestResponse.new(response_params)
        
        remaining = @request.money_needed - @respond.amount

        if @respond.save && @request.update(money_needed: @respond.amount)
            redirect_to supporter_path(@respond.supporter_id)
        else
            flash[:error_messages] = @respond.errors.full_messages
            @respond
            render :new 
        end
    end

    private

    def response_params
        params.require(:request_response).permit(:request_id, :supporter_id, :status, :message, :amount)
    end
end
