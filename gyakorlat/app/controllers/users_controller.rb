class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:user] = 'Successful registration'
      session[:user] = @user.id
      #redirect_back fallback_location: hello_path
      redirect_to '/subjects'
    else
      flash[:user] = @user.errors.messages
      redirect_to register_path
    end
  end

  def edit
    #flash[:notice] = @user.id
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Update successful"
    else
      flash[:user] = "Could not update profile"
    end
    #redirect_back fallback_location: hello_path
    redirect_to '/subjects'
  end

  def show
  end

  def forgotten
  end

  def send_forgotten
  end

  private
    def user_params
      params.require(:user).permit([:name, :email, :password, :password_confirmation])
    end
end
