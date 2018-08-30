class CreatePracticeTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :practice_times do |t|
      t.time :start_time
      t.time :end_time
      t.integer :hospital_id

      t.timestamps
    end
  end
end
