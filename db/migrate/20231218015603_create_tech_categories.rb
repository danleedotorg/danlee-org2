class CreateTechCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :tech_categories do |t|
      t.text :name, null: false

      t.timestamps
    end
  end
end
