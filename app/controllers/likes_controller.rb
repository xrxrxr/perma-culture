class LikesController < ApplicationController
	def create
		if params[:comment_id]
			@post = Comment.find(params[:post_id])
			if current_user.likes.find_by(likeable_type: 'Comment', likeable_id: params[:post_id]).nil?
				flash[:notice] = 'You like it !'
				@like = Like.new(user: current_user, likeable: @post)
				if @like.save
					respond_to do |format|
						format.html { redirect_to posts_path, notice: "Thanks for your like!" }
						format.js
					end
				else
					respond_to do |format|
						format.html { redirect_to @post, alert: "Awwwhh snap! No likes for the likes of you." }
					end
				end
			else
				flash[:notice] = "Vous n'aimez plus !"
				Like.find_by(likeable_type: 'Comment', likeable_id: params[:post_id]).destroy
				respond_to do |format|
					format.html { redirect_to posts_path, notice: "Thanks for your like!" }
					format.js
				end
			end


		else	
			@post = Post.find(params[:post_id])
			if current_user.likes.find_by(likeable_type: 'Post', likeable_id: params[:post_id]).nil?
				flash[:notice] = 'You like it !'
				@like = Like.new(user: current_user, likeable: @post)
				if @like.save
					respond_to do |format|
						format.html { redirect_to posts_path, notice: "Thanks for your like!" }
						format.js
					end
				else
					respond_to do |format|
						format.html { redirect_to @post, alert: "Awwwhh snap! No likes for the likes of you." }
					end
				end
			else
				flash[:notice] = "Vous n'aimez plus !"
				Like.find_by(likeable_type: 'Post', likeable_id: params[:post_id]).destroy
				respond_to do |format|
					format.html { redirect_to posts_path, notice: "Thanks for your like!" }
					format.js
				end
			end
		end
	end

	def destroy
	end
end
