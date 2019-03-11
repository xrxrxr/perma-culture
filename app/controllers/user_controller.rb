class UserController < ApplicationController
	def index
	end

	def show
		@profile = set_user
	end

	def destroy
	end

	def edit
		@profile = set_user
	end

	def update
		@user = set_user
		post_params = params.require(:user).permit(:username)

		if @user.update(post_params)
			flash[:success] = 'Profile updated'
			redirect_to @user
		else
			render :edit
		end
	end

	private 

	def set_user
		User.find(params[:id])
	end
end
