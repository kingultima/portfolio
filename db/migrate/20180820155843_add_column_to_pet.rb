class AddColumnToPet < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :hospital_id, :integer
  end
end
