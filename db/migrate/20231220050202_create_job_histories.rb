class CreateJobHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :job_histories do |t|
      t.text :company_name, null: false
      t.date :start_date, null: false
      t.date :end_date, null: true

      t.timestamps
    end
  end
end
