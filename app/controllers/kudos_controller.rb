class KudosController < ApplicationController
    
    def new
        @kudos = Kudo.new
        @professions = Profession.All 
        @supporter_id = session[:user_id]
    end

    def create
        @kudo = Kudo.new(kudo_params)
        if @kudo.save
            flash[:notice] = "Kudo added successfully!"
            redirect_to supporter_path(@kudo.supporter_id)
        else
            flash[:error_messages] = @kudo.errors.full_messages
            @kudo
            render supporter_path(@kudo.supporter_id)
        end
    end

    def show

    end

    def destroy
        @remove = Kudo.find(params[:format])
        @remove.destroy
        redirect_to workers_path
    end

    private

    def kudo_params
        params.require(:kudo).permit(:profession, :title, :comment, :supporter_id)
    end
end
