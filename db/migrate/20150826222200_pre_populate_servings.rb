class PrePopulateServings < ActiveRecord::Migration
  def change
    add_column(:ingredients, :serving, :string)
  end
end
