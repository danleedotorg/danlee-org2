json.extract! job_history, :id, :company_name, :start_date, :end_date, :created_at, :updated_at
json.url job_history_url(job_history, format: :json)
