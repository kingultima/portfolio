class AddColumnToPethospital < ActiveRecord::Migration[5.2]
  def change
    add_column :pethospitals, :day_id, :integer
  end
end
