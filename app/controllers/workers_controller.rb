class WorkersController < ApplicationController

    def index
    end

    def new
        @worker = Worker.new
        @neighborhoods = Neighborhood.all 
        @professions = Profession.all 
    end

    def create
        @worker = Worker.new(worker_params)

        if @worker.save
            redirect_to worker_path(@worker.id)
        else
            flash[:error_messages] = @worker.errors.full_messages
            @worker
            @neighborhoods = Neighborhood.all 
            @professions = Profession.all
            render :new 
        end
    end

    def edit
    end

    def update
    end

    def show
        @worker = Worker.find(params[:id])
        session[:user] = @worker
        @request = FinancialRequest.new
        @stats = @worker.statistics
        @all_requests = @worker.financial_requests.order("created_at DESC")
    end

    private

    def worker_params
        params.require(:worker).permit(:username, :password_digest, :full_name, :stress, :dependents, :field_of_work, :neighborhood)
    end

end
