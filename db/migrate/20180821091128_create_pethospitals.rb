class CreatePethospitals < ActiveRecord::Migration[5.2]
  def change
    create_table :pethospitals do |t|
      t.integer :hospital_id
      t.integer :pet_id
      t.integer :day_id

      t.timestamps
    end
  end
end
