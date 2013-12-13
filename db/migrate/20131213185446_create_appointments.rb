class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :hour
      t.string :date
      t.boolean :active

      t.timestamps
    end
  end
end
