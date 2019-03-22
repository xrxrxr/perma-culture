module UsersHelper
  def liked?(likeable)
    self.likes.find_by(likeable: likeable).nil?
  end

  def build_geojson(users)
  	@geojson = Array.new
  	users.each do |user|
  		unless user.doesnt_have_an_address
  			@geojson << {
  				type: "Feature",
  				geometry: {
  					type: "point",
  					coordinates: [user.longitude, user.latitude]
  				},
  				properties: {
  					title: user.user_name,
  					description: "<div class='photo-container'> <img src='#{Rails.application.routes.url_helpers.rails_blob_path(user.avatar, only_path: true)}' alt='Photo de profile'></div><br><a href='/profil/#{user.id}'>Voir profile</a>"
  				}
  			}
  		end
  	end
  end
end
