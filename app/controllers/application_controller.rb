class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :set_search
	before_action :configure_permitted_parameters, if: :devise_controller?

	def set_search
		@search = Hospital.ransack(params[:q])
		@results = @search.result.page(params[:page])
	end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up){ |u| u.permit(:name, :email, :password, :password_confirmation, :admin)}
		devise_parameter_sanitizer.permit(:account_update){ |u| u.permit(:name, :email,  :password, :password_confirmation,:admin)}
	end

	private
	def search_params
		params.require(:q).permit(:name_cont, :address_cont, :pets_id_eq, days_id_in: [])
	end

end
