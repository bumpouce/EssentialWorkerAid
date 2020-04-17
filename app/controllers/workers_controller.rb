class WorkersController < ApplicationController
    before_action :require_login
    before_action :is_worker?
    skip_before_action :require_login, only: [:new, :create]

    def index
        profession = Profession.find(current_user.field_of_work)
        @mykudos = Kudo.select_kudos_by(profession.category)
        @generalkudos = Kudo.select_kudos_by("General")
    end

    def new
        @worker = Worker.new
        @neighborhoods = Neighborhood.all 
        @professions = Profession.all 
    end

    def create
        @worker = Worker.new(worker_params)
        if @worker.save
            session[:user_id] = @worker.id
            session[:user_type] = "worker"
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
        @worker = current_user
        session[:user_id] = @worker.id
        @request = FinancialRequest.new
        @stats = @worker.statistics
        @all_requests = @worker.financial_requests.order("created_at DESC")
        @professions = Profession.all
    end

    private

    def worker_params
        params.require(:worker).permit(:username, :password, :confirm_password, :full_name, :stress, :dependents, :field_of_work, :neighborhood)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

    def is_worker?
        user_type == "worker"
    end
end
