class RenameTimeIdColumnToHospitals < ActiveRecord::Migration[5.2]
  def change
  	rename_column :hospitals, :time_id, :practice_time_id
  end
end
