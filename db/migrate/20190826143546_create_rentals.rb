class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.date :start_date
      t.date :end_date
      t.references :ufo, foreign_key: true
      t.references :customer, references: :users, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
