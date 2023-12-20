class CreateJobHistoriesTechnologies < ActiveRecord::Migration[7.1]
  def change
    create_join_table :job_histories, :technologies do |t|
      t.index :technology_id
      t.index :job_history_id

      t.timestamps
    end
  end
end
