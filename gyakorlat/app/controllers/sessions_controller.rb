class SessionsController < ApplicationController
  def create
    @user = User.authenticate params[:email], params[:password]
    if @user
      session[:user] = @user.id
      flash[:notice] = 'Successful login'
    else
      flash[:notice] = 'Invalid email address or password'
    end
    redirect_back fallback_location: '/subjects/'
  end

  def destroy
    reset_session
    flash[:notice] = 'Successful logout'
    redirect_back fallback_location: hello_path
  end
end
