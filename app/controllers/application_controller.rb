class ApplicationController < ActionController::Base
    helper_method :current_user,

    def current_user
        if(session[:user_id] && session[:user_id] != nil)
            return User.find(session[:user_id])
        else
            nil
        end
    end
end
