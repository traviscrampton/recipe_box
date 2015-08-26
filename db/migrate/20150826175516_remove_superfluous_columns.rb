class RemoveSuperfluousColumns < ActiveRecord::Migration
  def change

    remove_column(:recipes, :tag_id)
    remove_column(:tags, :recipe_id)

  end
end
