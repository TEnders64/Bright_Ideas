class SessionsController < ApplicationController
  def create
  	user = User.find_by_email(params[:user][:email])
  	if user && user.authenticate(params[:user][:password])
  		session[:user_id] = user.id 
  		redirect_to "/bright_ideas"
  	else
  		flash[:errors] = "Can not find email/password combination"
  		redirect_to "/main"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to "/main"
  end
end
