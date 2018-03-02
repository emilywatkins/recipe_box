class ChangeJoinColumnsToSingular < ActiveRecord::Migration[5.1]
  def change
    rename_column :ingredients_recipes, :ingredients_id, :ingredient_id
    rename_column :ingredients_recipes, :recipes_id, :recipe_id
    rename_column :recipes_tags, :recipes_id, :recipe_id
    rename_column :recipes_tags, :tags_id, :tag_id
  end
end
