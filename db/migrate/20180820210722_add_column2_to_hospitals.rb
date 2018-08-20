class AddColumn2ToHospitals < ActiveRecord::Migration[5.2]
  def change
    add_column :hospitals, :pet_id, :integer
  end
end
