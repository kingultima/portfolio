class ApplicationController < ActionController::Base
	before_action :set_search

	def set_search
		@search = Hospital.ransack(params[:q])
		@result = @search.result
	end

	private

	def search_params
		params.require(:q).permit(:pet_id_in, :day_id_in)
	end

end
