module UsersHelper
  def liked?(likeable)
    self.likes.find_by(likeable: likeable).nil?
  end

  def build_geojson(users)
  	@geojson = Array.new
  	users.each do |user|
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
  				description: "<div class='photo-container'> <img src='#{Rails.application.routes.url_helpers.rails_blob_path(current_user.avatar, only_path: true)}' alt='Photo de profile'></div><br>"
  			}
  		}
  	end
  end
end
