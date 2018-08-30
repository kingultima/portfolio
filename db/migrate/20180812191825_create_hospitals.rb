class CreateHospitals < ActiveRecord::Migration[5.2]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :tel
      t.text :hospital_image_id

      t.timestamps
    end
  end
end
