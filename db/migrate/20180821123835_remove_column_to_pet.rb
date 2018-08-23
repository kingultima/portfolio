class RemoveColumnToPet < ActiveRecord::Migration[5.2]
  def change
  	remove_columns :pets, :hospital_id
  end
end
