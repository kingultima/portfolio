class CreateHospitals < ActiveRecord::Migration[5.2]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :caption
      t.text :description
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :tel
      t.integer :time_id
      t.text :hospital_image
      t.string :pet
      t.string :tag

      t.timestamps
    end
  end
end
