class CreateUfos < ActiveRecord::Migration[5.2]
  def change
    create_table :ufos do |t|
      t.string :brand
      t.integer :speed
      t.integer :age
      t.integer :price
      t.text :description
      t.references :owner, references: :users, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
