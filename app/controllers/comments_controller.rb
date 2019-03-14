class CommentsController < ApplicationController
	def create
		@comment = Comment.new(user: current_user, content:params[:comment][:content], commenteable: Post.find(params[:post_id]))

		if @comment.save
			respond_to do |format|
				format.html { redirect_to posts_path(params[:post_id]), notice: "Votre commentaire a bien été créé" }
				format.js
			end
		else
			redirect_to posts_path(params[:post_id])
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