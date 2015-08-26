class RenameRecipesTagsTableToReverse < ActiveRecord::Migration
  def change
    drop_table(:recipes_tags) do
    end

    create_table(:tags_recipes) do |t|
      t.column(:recipe_id, :integer)
      t.column(:tag_id, :integer)
    end
  end
end
