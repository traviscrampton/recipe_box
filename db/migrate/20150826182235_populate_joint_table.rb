class PopulateJointTable < ActiveRecord::Migration
  def change
    drop_table(:tags_recipes) do
    end

    create_table(:recipes_tags) do |t|
    t.column(:recipe_id, :integer)
    t.column(:tag_id, :integer)
    end
    
  end
end
