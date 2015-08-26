class EditIngredientsColumn < ActiveRecord::Migration
  def change
    remove_column(:ingredients, :type, :string)
    add_column(:ingredients, :kind, :string)
  end
end
