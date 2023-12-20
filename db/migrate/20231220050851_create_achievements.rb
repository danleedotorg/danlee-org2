class CreateAchievements < ActiveRecord::Migration[7.1]
  def change
    create_table :achievements do |t|
      t.text :summary
      t.references :job_history, null: false, foreign_key: true

      t.timestamps
    end
  end
end
