class RemoveColumnToHospital < ActiveRecord::Migration[5.2]
  def change
  	remove_columns :hospitals, :description, :caption, :tag, :day
  end
end
