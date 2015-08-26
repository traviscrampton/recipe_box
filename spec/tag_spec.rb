require('spec_helper')

describe(Tag) do
  it("belongs to a recipe") do
    test_recipe = Recipe.create({:name => "Sausage Delight"})
    test_tag1 = Tag.create({:description => "Hearty Food", :recipe_id => test_recipe.id})
    expect(test_recipe.tags()).to(eq([test_tag1]))
  end
end
