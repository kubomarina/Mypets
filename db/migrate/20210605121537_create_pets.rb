class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.text :Animal_name
      t.text :introduction
      t.integer :pet_image_id
      t.integer :user_id

      t.timestamps
    end
  end
end
