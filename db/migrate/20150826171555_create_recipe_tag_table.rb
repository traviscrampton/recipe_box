class CreateRecipeTagTable < ActiveRecord::Migration
  def change
    create_table(:recipe_tag) do |t|
      t.column(:recipe_id, :integer)
      t.column(:tag_id, :integer)
    end
  end
end
