class HospitalsController < ApplicationController
  before_action :set_hospital, only: [:show, :edit, :update, :destroy]

  def index
    # @hospital = Hospital.find.params([:id])
    @hospitals = Hospital.all.page(params[:page])
    # @pets = @hospital.pets
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
    @pets = Pet.all
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
    # Use callbacks to share common setup or constraints between actions.
    def set_hospital
      @hospital = Hospital.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def hospital_params
      params.require(:hospital).permit( :name, :caption, :description, :address, :latitude, :longitude, :tel, :hospital_image, :tag, :pet_id, pet_ids: [], day: [], practice_times_attributes: [:id, :start_time, :end_time, :_destroy])
    end
  end
