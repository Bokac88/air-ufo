class AddPhotoToUfos < ActiveRecord::Migration[5.2]
  def change
    add_column :ufos, :photo, :string
  end
end
