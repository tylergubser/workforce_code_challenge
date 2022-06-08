class ApplicationController < ActionController::Base
    helper_method :current_user,
    # setting current user with user id to float around application 
    def current_user
        if(session[:user_id] && session[:user_id] != nil)
            return User.find(session[:user_id])
        else
            nil
        end
    end
end
