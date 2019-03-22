class UsersController < ApplicationController
	include UsersHelper
	before_action :is_not_your_profile, only: [:edit]

	def index
		@users = User.search(params[:search])
		@user = current_user
		build_geojson(@users)

		respond_to do |format|
		  format.html
		  format.js
		  format.json { render json: @geojson }
		end
	end

	def show
		@users = User.all
		@user = set_user
	end

	def destroy; end

	def edit
		@user = set_user
	end

	def update
		@user = set_user

		if @user.update(post_params)
			respond_to do |format|
				format.js
				format.html { redirect_to @user, notice: 'Description mise a jour.' }
			end
		else
			render :edit
		end
	end

	private

	def is_not_your_profile
	    unless params[:id].to_i == current_user.id
	    	flash[:danger] = "Desole, ce n'est pas votre profil !"
	        redirect_to posts_path
	        return true
	    end
	end

	def set_user
		User.find(params[:id])
	end

	def post_params
      params.require(:user).permit(:user_name, :description, :address, :search, :avatar)
    end
end
