class ApplicationController < ActionController::Base
	before_action :set_search

	def set_search
		@search = Hospital.ransack(params[:q])
		@result = @search.result
	end

	private


end
