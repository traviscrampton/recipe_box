class RenameIdColumn < ActiveRecord::Migration
  def change
    remove_column(:amounts, :recipe_id, :integer)
    add_column(:amounts, :ingredient_id, :integer)
  end
end
