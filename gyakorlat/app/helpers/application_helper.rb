module ApplicationHelper
  def logged_in?
    #false
    #true
    session[:user]
  end
end
