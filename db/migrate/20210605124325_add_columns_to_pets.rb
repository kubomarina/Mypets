class AddColumnsToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :hobby, :text
    add_column :pets, :food, :text
    add_column :pets, :tool, :text
    add_column :pets, :caution, :text
  end
end
