class ApplicationController < ActionController::Base
	before_action :set_search

	def set_search
		@search = Hospital.ransack(search_params)

		@result = @search.result
	end

	private

	def search_params
		params.require(:q).permit(:name_cont, :address_cont, :pets_id_eq, days_id_in: [])
	end

end
