class AddTables < ActiveRecord::Migration[5.1]
  def change
    create_table(:recipes) do |t|
      t.column(:name, :string)
      t.column(:instructions, :string)
    end
    create_table(:ingredients) do |t|
      t.column(:name, :string)
    end
    create_table(:ingredients_recipes) do |t|
      t.column(:ingredients_id, :integer)
      t.column(:recipes_id, :integer)
    end
    create_table(:tags) do |t|
      t.column(:description, :string)
    end
    create_table(:recipes_tags) do |t|
      t.column(:recipes_id, :integer)
      t.column(:tags_id, :integer)
    end
  end
end
