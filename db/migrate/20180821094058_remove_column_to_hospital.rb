class RemoveColumnToHospital < ActiveRecord::Migration[5.2]
  def change
  	remove_columns :hospitals, :pet, :pet_id
  end
end
