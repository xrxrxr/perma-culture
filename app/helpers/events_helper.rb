module EventsHelper
	
  def build_geojson(events)
  	@geojson = Array.new
  	events.each do |event|
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
  end
end
