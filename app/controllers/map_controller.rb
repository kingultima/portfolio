class MapController < ApplicationController

	def index
		@hospitals = Hospital.all
		@hash = Gmaps4rails.build_markers(@hospitals) do |hospital, marker|
			marker.lat hospital.latitude
			marker.lng hospital.longitude
			marker.infowindow render_to_string(partial: "hospitals/infowindow", locals: { hospital: hospital })
			# marker.json({name: hospital.name})
		end
	end
end
