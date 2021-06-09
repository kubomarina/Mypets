class AddColumnsToTagMaps < ActiveRecord::Migration[5.2]
  def change
    add_column :tag_maps, :post, :integer
    add_column :tag_maps, :tag, :integer
  end
end
