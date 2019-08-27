class AddAvailabilityToUfos < ActiveRecord::Migration[5.2]
  def change
    add_column :ufos, :availability, :boolean, default: true, null: false
  end
end
