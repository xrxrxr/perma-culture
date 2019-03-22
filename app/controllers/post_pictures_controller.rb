class PostPicturesController < ApplicationController
 	
 	def create
		@post = Post.find(params[:post_id])
		
		unless params[:post_pictures].nil?
			@post.post_pictures.attach(params[:post_pictures])
			respond_to do |format|
				format.html { redirect_to posts_path, notice: "Photo ajoutee !" }
				format.js
			end
		else
			@post.post_pictures.purge
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@post.post_pictures.find(params[:id]).purge
		respond_to do |format|
			format.html { redirect_to posts_path, notice: "Photo supprimee !" }
			format.js
		end
	end
end
