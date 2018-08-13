class AddColumnToHospitals < ActiveRecord::Migration[5.2]
  def change
    add_column :hospitals, :day, :string
  end
end
