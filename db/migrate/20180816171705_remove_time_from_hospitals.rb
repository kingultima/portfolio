class RemoveTimeFromHospitals < ActiveRecord::Migration[5.2]
  def change
    remove_column :hospitals, :practice_time_id, :time
  end
end
