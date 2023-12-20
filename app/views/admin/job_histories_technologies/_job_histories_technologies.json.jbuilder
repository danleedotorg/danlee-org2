json.extract! job_histories_technologies, :id, :job_history_id, :technology_id, :created_at, :updated_at
json.url job_histories_technologies_url(job_histories_technologies, format: :json)
