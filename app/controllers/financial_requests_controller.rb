class FinancialRequestsController < ApplicationController

    def show
        @request = FinancialRequest.find(params[:id])
        @worker = Worker.find(@request[:worker_id])
        @responses = RequestResponse.where(request_id: @request.id)
    end

    def new
        @request = FinancialRequest.new
        @workers = Worker.all
    end

    def create
        @financial_request = FinancialRequest.new(request_params)
        
        if @financial_request.save
            redirect_to worker_path(@financial_request.worker_id)
        else
            flash[:error_messages] = @financial_request.errors.full_messages
            @financial_request
            render worker_path(@financial_request.worker_id)
        end
    end

    def edit
        @request = FinancialRequest.find(params[:id])
        @response = params[:response]
    end

    def update
        @request = FinancialRequest.find(params[:id])

        if @request.save
            redirect_to worker_path(@request.worker_id)
        else
            flash[:error_messages] = @request.errors.full_messages
            @request
            render worker_path(@request.worker_id)
        end
    end

    private

    def request_params
        params.require(:financial_request).permit(:money_needed, :title, :description, :venmo_name, :worker_id, :status, :updated_at)
    end
end
