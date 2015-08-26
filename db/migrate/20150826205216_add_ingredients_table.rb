class AddIngredientsTable < ActiveRecord::Migration
  def change
    create_table(:ingredients) do |t|
      t.column(:amount, :integer)
      t.column(:type, :string)
    end      
  end
end
