class LikesController < ApplicationController

	def index
		@likes = Like.all
	end

	def create
		idea = Idea.find(params['idea_id'])
		Like.create(user: current_user, idea: idea)
		redirect_to :back
	end
	
end
