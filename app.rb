require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  erb(:index)
end


#############################
######---Tags-Page---########
#############################
get('/tags') do
  @tags = Tag.all()
  erb(:tags)
end

post("/tags") do
  description = params.fetch("description")
  Tag.create({:description => description})
  redirect("/tags")
end


##########################
#####___Clear-Tags___#####
##########################
get("/clear/tags") do
	Tag.delete_all()
  @tags = Tag.all()
	erb(:tags)
end


#############################
######---Recipes-Page---#####
#############################
get('/recipes') do
  @recipes = Recipe.all()
  erb(:recipes)
end

post("/recipes") do
  name = params.fetch("name")
  Recipe.create({:name => name})
  redirect("/recipes")
end


##########################
####___Clear-Recipes___####
##########################
get("/clear/recipes") do
	Recipe.delete_all()
  @recipes = Recipe.all()
	erb(:recipes)
end


#############################
###---Ingredients-Page---####
#############################
get('/ingredients') do
  @ingredients = Ingredient.all()
  erb(:ingredients)
end

post("/ingredients") do
  kind = params.fetch("kind")
  Ingredient.create({:kind => kind, :amount => nil})
  redirect("/ingredients")
end


##########################
##__Clear-Ingredients___##
##########################
get("/clear/ingredients") do
	Ingredient.delete_all()
  @ingredients = Ingredient.all()
	erb(:ingredients)
end


#############################
######---Tag-Page---#########
#############################
get('/tags/:id') do
  @tag = Tag.find(params.fetch("id").to_i())
  if @tag.recipes
    @recipe = @tag.recipes
  else
    @recipe = nil
  end
  @recipes = Recipe.all()
  erb(:tag)
end

patch("/tags/:id") do
  recipe_id = params.fetch("recipe_id").to_i()
  recipe = Recipe.find(recipe_id)
  @tag = Tag.find(params.fetch("id").to_i())
  # @tag.update({:recipe_ids => [recipe_id]})
  @tag.recipes.push(recipe)
  redirect back
end

delete('/tags/:id/delete') do
	@tag = Tag.find(params['id'].to_i)
	@tag.destroy
	@tags = Tag.all()
	erb(:tags)
end

patch ('/tags/:id/rename') do
	@tag = Tag.find(params['id'].to_i)
  @tag.update({description: params["description"]})
	@tags = Tag.all()
	redirect back
end

#############################
####---Recipe-Page---########
#############################
get('/recipes/:id') do
  @recipe = Recipe.find(params.fetch("id").to_i())
  if @recipe.tags
    @tag = @recipe.tags
  else
    @tag = nil
  end
  @tags = Tag.all()
  @ingredients = Ingredient.all()
  erb(:recipe)
end

patch("/recipes/:id") do
  tag_id = params.fetch("tag_id").to_i()
  tag = Tag.find(tag_id)
  @recipe = Recipe.find(params.fetch("id").to_i())
  @recipe.tags.push(tag)
  redirect back
end

post("/recipes/:id/rating") do
  rating = params.fetch('rating').to_i()
  @recipe = Recipe.find(params.fetch("id").to_i())
  @recipe.update({:rating => rating})
  redirect back
end

patch("/recipes/:id/ingredients") do
  ingredient = params.fetch("ingredient").to_i()
  ingredient  = Ingredient.find(ingredient)
  ingredient.update({amount: params["amount"], serving: params["serving"]})
  @recipe = Recipe.find(params.fetch("id").to_i())
  @recipe.ingredients.push(ingredient)
  redirect back
end

post("/recipes/:id/instructions") do
  instructions = params.fetch('instructions')
  @recipe = Recipe.find(params.fetch("id").to_i())
  @recipe.update({:instructions => instructions})
  # binding.pry
  redirect back
end



#############################
####---Ingredient-Page---####
#############################
get('/ingredients/:id') do
  @ingredient = Ingredient.find(params.fetch("id").to_i())
  if @ingredient.recipes
    @recipe = @ingredient.recipes
  else
    @recipe = nil
  end
  @recipes = Recipe.all()
  erb(:ingredient)
end

delete('/ingredients/:id/delete') do
	@ingredient = Ingredient.find(params['id'].to_i)
	@ingredient.destroy
	@ingredients = Ingredient.all()
	erb(:ingredients)
end

patch ('/ingredients/:id/rename') do
	@ingredient = Ingredient.find(params['id'].to_i)
  @ingredient.update({kind: params["kind"]})
	@ingredients = Ingredient.all()
	redirect back
end
