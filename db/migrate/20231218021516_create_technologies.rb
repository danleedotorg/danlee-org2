class CreateTechnologies < ActiveRecord::Migration[7.1]
  def change
    create_table :technologies do |t|
      t.text :name
      t.references :tech_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
