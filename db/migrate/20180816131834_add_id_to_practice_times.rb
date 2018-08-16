class AddIdToPracticeTimes < ActiveRecord::Migration[5.2]
  def change
    add_column :practice_times, :hospital_id, :integer
  end
end
