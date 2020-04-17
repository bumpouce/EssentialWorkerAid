class SupportersController < ApplicationController
    before_action :require_login
    before_action :is_supporter?
    skip_before_action :require_login, only: [:new, :create]

    def index
    end

    def new
        @supporter = Supporter.new
    end

    def create
        @supporter = Supporter.new(supporter_params)
        if @supporter.save
            session[:user_id] = @supporter.id
            session[:user_type] = "supporter"
            redirect_to supporter_path(@supporter.id)
        else
            flash[:error_messages] = @supporter.errors.full_messages
            @supporter
            render :new 
        end
    end

    def show
        @supporter = current_user
        @supporter_id = @supporter.id
        @stats = @supporter.statistics
        @kudos = Kudo.new
        @professions = Profession.all
        @requests = FinancialRequest.where(status: "active").order("updated_at DESC")
        @myrequests = RequestResponse.where(supporter_id: @supporter_id)
    end

    private

    def supporter_params
        params.require(:supporter).permit(:username, :password, :confirm_password, :full_name)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

    def is_supporter?
        user_type == "supporter"
    end
end
