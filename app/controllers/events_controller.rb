class EventsController < ApplicationController
  def index
  	# HELPER
  	@events = Event.all
  	@geojson = Array.new

  	@events.each do |event|
  		unless event.latitude.nil?
  			@geojson << {
  				type: "Feature",
  				geometry: {
  					type: "point",
  					coordinates: [event.longitude, event.latitude]
  				},
  				properties: {
  					title: event.description,
            description: ""
  				}
  			}
  		end
  	end
		# HELPER 

		respond_to do |format|
			format.html
			format.json { render json: @geojson }
		end
  end
end
