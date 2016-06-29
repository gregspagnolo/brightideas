class IdeasController < ApplicationController
	before_action :require_login, only: [:index, :create, :destroy]

	def index
		@ideas = Idea.all
		@likes = Like.all
	end

	def create
		idea = Idea.new(content: params[:content], user: current_user)
		if idea.save
			flash[:success] = ["You've added an idea. Wait for the likes to roll in"]
			redirect_to :back
		else
			flash[:errors] = ["Well, that's not a very good idea. You need to put SOMETHING!"]
		end
	end

	def show
		@idea = Idea.find(params[:id])
		@likes = @idea.likes
	end

	def destroy
		Idea.find(params[:idea_id]).destroy
		redirect_to :back
		flash[:success] = ["Your bright idea has been deleted"]
	end
end
