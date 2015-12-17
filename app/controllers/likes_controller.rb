class LikesController < ApplicationController
  def create
  	like = Like.new( like_params )
  	like[:user_id] = User.find( session[:user_id] ).id 
  	if like.valid?
  		like.save
  		redirect_to "/bright_ideas"
  	else
  		flash[:errors] = like.errors.full_messages
  		redirect_to "/bright_ideas"
  	end
  end

  private
  	def like_params
  		params.require(:like).permit(:idea_id)
  	end
end
