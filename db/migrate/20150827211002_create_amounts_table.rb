class CreateAmountsTable < ActiveRecord::Migration
  def change
    create_table(:amounts) do |t|
      t.column(:amount, :integer)
      t.column(:serving, :string)
      t.column(:recipe_id, :integer)
    end
  end
end
