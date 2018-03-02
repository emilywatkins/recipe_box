require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @recipes = Recipe.all
  @ingredients = Ingredient.all
  erb(:index)
end

post('/recipes') do
  name = params['name']
  @recipe = Recipe.create({:name => name, :instructions => nil})
  redirect("/recipes/".concat(@recipe.id.to_s))
end

get('/recipes/:id') do
  @recipe = Recipe.find(params['id'].to_i)
  erb(:recipe)
end

post('/recipes/:id') do
  instruction = params['instruction']
  @recipe = Recipe.find(params['id'].to_i)
  @recipe.instructions = instruction
  @recipe.save
  erb(:recipe)
end

post('/recipes/:id/ingredients') do
  ingredient = params['name']
  new_ingredient = Ingredient.create({:name => ingredient})
  recipe = Recipe.find(params['id'].to_i)
  recipe.ingredients << new_ingredient # this will push new_ingredient into ingredients_recipes table.
  redirect("/recipes/".concat(recipe.id.to_s))
end

post('/recipes/:id/tags') do
  tag = params['description']
  new_tag = Tag.find_or_create_by({:description => tag})
  recipe = Recipe.find(params['id'].to_i)
  recipe.tags << new_tag
  redirect("/recipes/".concat(recipe.id.to_s))
end

get('/tags') do
  @tags = Tag.all
  erb(:tags)
end

get('/recipes') do
  if params['ingredient_id']
    @ingredient = Ingredient.find(params['ingredient_id'].to_i)
    @recipes = @ingredient.recipes
  else
    @recipes = Recipe.all
  end
  erb(:recipes)
end
