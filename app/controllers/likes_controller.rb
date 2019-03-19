class LikesController < ApplicationController

	def create
		params[:comment_id] ? @likeable = Comment.find(params[:comment_id]) : @likeable = Post.find(params[:post_id])

		if current_user.dont_already_like?(@likeable)
			@like = Like.new(user: current_user, likeable: @likeable)
			if @like.save
				respond_to do |format|
					format.html { redirect_to posts_path, notice: "Merci pour votre like!" }
					format.js
				end
			else
				respond_to do |format|
					format.html { redirect_to posts_path, alert: "Erreur lors du likes, desole" }
				end
			end
		else
			Like.find_by(likeable: @likeable).destroy
			respond_to do |format|
				format.html { redirect_to posts_path, notice: "Vous n'aimez plus !" }
				format.js
			end
		end
	end
end
