class RenameHospitalImageColumnToHospitals < ActiveRecord::Migration[5.2]
  def change
  	rename_column :hospitals, :hospital_image, :hospital_image_id
  end
end
