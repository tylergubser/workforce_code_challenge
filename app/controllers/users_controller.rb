class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  
  def index
    @users = User.all
  end

  
  def show
  end

  
  def new
    @user = User.new
  end

  
  def edit
  end

  
  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    respond_to do |format|
      if @user.save
        format.html { redirect_to organisations_path}
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Checking if user is apart of organisation or not then redirecting to proper place
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { if @user.organisation_id == nil 
                      redirect_to organisations_path
                      else 
                      redirect_to organisation_path(@user.organisation_id) end} 
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  # updating user with the selected organisation id
  def join_organisation
    user = User.find(current_user.id)
    user.update_attribute(:organisation_id, params[:organisation_id])
    redirect_to organisation_path(params[:organisation_id])
  end
  # updating user's organisation id to nil 
  def leave_organisation
    user = User.find(current_user.id)
    user.update_attribute(:organisation_id, nil)
    redirect_to organisations_path
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(current_user[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:organisation_id, :name, :email_address, :password)
    end
end
