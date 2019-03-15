class CommentsController < ApplicationController
	def create
			@comment_thread = Comment.new
		if params[:comment_id]
			@comment_thread = Comment.new(user: current_user, content:params[:comment][:content], commenteable: Comment.find(params[:comment_id]))

			if @comment_thread.save
				puts 'COMMENT TREAD'
				respond_to do |format|
					format.html { redirect_to posts_path(params[:post_id]), notice: "Votre commentaire a bien été créé" }
					format.js
				end
			else
				redirect_to posts_path(params[:post_id])
			end

		else
			@comment = Comment.new(user: current_user, content:params[:comment][:content], commenteable: Post.find(params[:post_id]))
			if @comment.save
				puts 'COMMENT POST'
				respond_to do |format|
					format.html { redirect_to posts_path(params[:post_id]), notice: "Votre commentaire a bien été créé" }
					format.js
				end
			else
				redirect_to posts_path(params[:post_id])
			end
		end		
	end

	def edit
		@lecomment = Comment.find(params[:id])
	end

	def update
		@lecomment = Comment.find(params[:id])
		post_params = params.require(:comment).permit(:content)

		if @lecomment.update(post_params)
			flash[:notice] = 'votre commentaire a bien été édité'
			redirect_to posts_path(Comment.find(params[:id]).commenteable_id)
		else
		end
	end

	def destroy
		post = []
		post << Comment.find(params[:id]).commenteable_id

		@lecomment = Comment.find(params[:id])
		if @lecomment.destroy
			flash[:notice] = 'Commentaire supprime avec succes'
			redirect_to posts_path(potin)
		else
			render :destroy
		end
	end
end