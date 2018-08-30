class HospitalsController < ApplicationController
  before_action :set_hospital, only: [:show, :edit, :update, :destroy]
  # before_action :admin_user,　only: [:new, :create, :edit, :update, :destroy]

  def top
  end

  def search
    @search = Hospital.ransack(params[:q])
    @results = @search.result.includes(:days, :pets).page(params[:page])
    @pets = Pet.all
    @days = Day.all
  end

  def index
    @hospitals = Hospital.page(params[:page])
  end

  def show
    @practice_time = @hospital.practice_times
    @hash = Gmaps4rails.build_markers(@hospital) do |hospital, marker|
      marker.lat hospital.latitude
      marker.lng hospital.longitude
      marker.infowindow render_to_string(partial: "hospitals/infowindow", locals: { hospital: hospital })
    end
  end

  def new
    @hospital = Hospital.new
    @practice_time = @hospital.practice_times.build
  end

  def edit
  end

  def create
    @hospital = Hospital.new(hospital_params)

    respond_to do |format|
      if @hospital.save
        format.html { redirect_to @hospital, notice: 'Hospital was successfully created.' }
        format.json { render :show, status: :created, location: @hospital }
      else
        format.html { render :new }
        format.json { render json: @hospital.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @hospital.update(hospital_params)
        format.html { redirect_to @hospital, notice: 'Hospital was successfully updated.' }
        format.json { render :show, status: :ok, location: @hospital }
      else
        format.html { render :edit }
        format.json { render json: @hospital.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hospital.destroy
    respond_to do |format|
      format.html { redirect_to hospitals_url, notice: 'Hospital was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_hospital
    @hospital = Hospital.find(params[:id])
  end

  def hospital_params
    params.require(:hospital).permit( :name, :address, :latitude, :longitude, :tel, :hospital_image, pet_ids: [], day_ids: [], practice_times_attributes: [:id, :start_time, :end_time, :_destroy])
  end

  def search_params
    params.require(:q).permit(:name_cont, :address_cont, :pets_id_eq, :days_id_in)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
