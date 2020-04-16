class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :user_type
    helper_method :logged_in?

    def user_type
        session[:user_type]
    end

    def current_user    
        if user_type == "worker"
            Worker.find(session[:user_id])  
        else
            Supporter.find(session[:user_id])
        end
    end

    def logged_in?
        !!current_user  
    end
end
