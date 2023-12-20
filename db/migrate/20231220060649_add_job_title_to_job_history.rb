class AddJobTitleToJobHistory < ActiveRecord::Migration[7.1]
  def change
    add_column :job_histories, :job_title, :text, null: false, default: 'CHANGE ME'
  end
end
