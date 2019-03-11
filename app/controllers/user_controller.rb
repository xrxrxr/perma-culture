class UserController < ApplicationController
	def index
	end

	def show
		@profile = User.find(params[:id])
	end

	def destroy
	end

	def edit
		@profile = current_user
	end

	def update
		@user = current_user
		post_params = params.require(:user).permit(:username, :first_name, :last_name)

		if @user.update(post_params)
			flash[:success] = 'Profile updated'
			redirect_to @user
		else
			render :edit
		end
	end
end
