class UsersController < ApplicationController
	before_action :is_not_your_profile, only: [:edit]

	def index
		# @users = User.all
		@users = User.search(params[:search])
		# HELPER
		@geojson = Array.new
		
		@users.each do |user|
			unless user.latitude.nil? || user.longitude.nil? || user.address.empty?
				@geojson << {
					type: "Feature",
					geometry: {
						type: "point",
						coordinates: [user.longitude, user.latitude]
					},
					properties: {
						title: user.user_name,
						description: "<div class='photo-container'> <img src='#{Rails.application.routes.url_helpers.rails_blob_path(user.avatar, only_path: true)}' alt='Photo de profile'></div><br><a href='/users/#{user.id}'>Voir profile</a>"
					}
				}
			end
		end

		if current_user.latitude.nil?
			results = Geocoder.search(remote_ip)
			@geojson << {
				type: "Feature",
				geometry: {
					type: "point",
					coordinates: [results.first.coordinates[1], results.first.coordinates[0]]
				},
				properties: {
					title: current_user.user_name,
					description: "<div class='photo-container'> <img src='#{Rails.application.routes.url_helpers.rails_blob_path(current_user.avatar, only_path: true)}' alt='Photo de profile'></div><br><a href='/users/#{current_user.id}'>Voir profile</a>"
				}
			}
		end

		# HELPER 

		respond_to do |format|
		  format.html
		  format.js
		  format.json { render json: @geojson }
		end
	end

	def show
		@users = User.all
		@user = set_user
		@user_ip = remote_ip
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
      params.require(:user).permit(:user_name, :description, :address, :search)
    end
end
