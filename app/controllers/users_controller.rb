class UsersController < ApplicationController
    before_action :is_not_your_profile, only: [:show, :edit]

	def index
		@users = User.all
	end

	def show
		@user = set_user
	end

    def destroy; end

	def edit
		@user = set_user
	end

	def update
		@user = set_user

	    if @user.update(post_params)
	      flash[:success] = 'Profile updated'
	      redirect_to @user
	    else
	      render :edit
	    end
  	end

  private
	  def is_not_your_profile
	    unless params[:id].to_i == current_user.id
	    	flash[:danger] = "Desole, ce n'est pas votre profil !"
	        redirect_to posts_path
	    end
	  end

	def set_user
		User.find(params[:id])
	end

	def post_params
      params.require(:user).permit(:user_name)
    end
end
