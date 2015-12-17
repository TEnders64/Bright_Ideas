class IdeasController < ApplicationController
  def index
  	# @ideas = Idea.select("ideas.id, ideas.content, ideas.user_id, count(likes.id) AS likes_count").joins(:likes).group("ideas.id").order("likes_count DESC")
  	# @ideas = Idea.joins("LEFT JOIN likes ON likes.idea_id = idea.id")
  	@ideas = Idea.select("ideas.*, count(likes.id) AS likes_count").joins("LEFT JOIN likes ON likes.idea_id = ideas.id").group("ideas.id").order("likes_count DESC")
  	@user = User.find(session[:user_id])
  end

  def create
  	idea = Idea.new( idea_params )
  	idea[:user_id] = User.find( session[:user_id] ).id
  	if idea.valid?
  		idea.save
  		redirect_to "/bright_ideas"
  	else
  		flash[:errors] = idea.errors.full_messages
  		redirect_to "/bright_ideas"
  	end
  end

  def show
  	@idea = Idea.find(params[:id])
  end

  def destroy
  	idea = Idea.find(params[:id])
  	idea.destroy
  	redirect_to "/bright_ideas"
  end

  private
  	def idea_params
  		params.require(:idea).permit(:content)
  	end
end
