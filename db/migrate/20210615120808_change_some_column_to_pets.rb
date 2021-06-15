class ChangeSomeColumnToPets < ActiveRecord::Migration[5.2]
  def change
    change_column :pets, :pet_image_id, :string
  end
end
