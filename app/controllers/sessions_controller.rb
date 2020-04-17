class SessionsController < ApplicationController
    
    def index
        @worker = Worker.new
        @supporter = Supporter.new
    end

    def worker_sign_in
        @worker = Worker.new
        redirect_to worker_login_path
    end
    
    def worker_login
        @worker = Worker.find_by(username: params[:username])
        if @worker && @worker.authenticate(params[:password])
            session[:user_id] = @worker.id
            session[:user_type] = "worker"
            redirect_to worker_path(@worker.id)
        else
            flash[:notice] = "Invalid Username or Password"
            redirect_to root_path
        end
    end

    def supporter_sign_in
        @supporter = Supporter.new
        redirect_to supporter_login_path
    end
    
    def supporter_login 
        @supporter = Supporter.find_by(username: params[:username])
        if @supporter && @supporter.authenticate(params[:password])
            session[:user_id] = @supporter.id
            session[:user_type] = "supporter"
            redirect_to supporter_path(@supporter.id)
        else
            flash[:notice] = "Invalid Username or Password"
            redirect_to root_path
        end
   end


   def destroy
        session.clear
        redirect_to root_path
   end 
end