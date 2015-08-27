class SubractColumnsFromIngredients < ActiveRecord::Migration
  def change
    remove_column(:ingredients, :amount, :integer)
    remove_column(:ingredients, :serving, :string)
  end
end
