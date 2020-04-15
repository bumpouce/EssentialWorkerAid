class SupportersController < ApplicationController


    def index
    end

    def new
        @supporter = Supporter.new
    end

    def create
        @supporter = Supporter.new(supporter_params)

        if @supporter.save
            redirect_to supporter_path(@supporter.id)
        else
            flash[:error_messages] = @supporter.errors.full_messages
            @supporter
            render :new 
        end
    end

    def edit
    end

    def update
    end

    def show
        @supporter = Supporter.find(params[:id])
        session[:user] = @supporter.id
        @requests = FinancialRequest.where(status: "active")
        @myrequests = RequestResponse.where(supporter_id: @supporter.id)
    end

    private

    def supporter_params
        params.require(:supporter).permit(:username, :password_digest, :full_name)
    end

end
