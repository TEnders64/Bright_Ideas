class UsersController < ApplicationController
  def index
  end

  def create
  	user = User.new( user_params )
  	user.password_confirmation = params[:user][:c_password]
  	if user.valid?
  		user.save
  		session[:user_id] = user.id 
  		redirect_to "/bright_ideas"
  	else
  		flash[:errors] = user.errors.full_messages
  		redirect_to "/main"
  	end
  end

  def show
  	@user = User.find(params[:id])
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :alias, :email, :password)
  	end
end
