class SessionsController < ApplicationController
    def index
      
    end

    def new

    end

    def create
        @user = User.find_by(email_address: params[:email])
        if @user&& @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to organisations_path
        else
            redirect_to "/"
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end
end
