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


#############################
######---Tag-Page---#########
#############################
get('/tags/:id') do
  @tag = Tag.find(params.fetch("id").to_i())
  if @tag.recipe_id
    @recipe = Recipe.find(@tag.recipe_id)
  else
    @recipe = nil
  end
  @recipes = Recipe.all()
  erb(:tag)
end

patch("/tags/:id") do
  recipe_id = params.fetch("recipe_id").to_i()
  @tag = Tag.find(params.fetch("id").to_i())
  @tag.update({:recipe_id => recipe_id})
  redirect back
end
