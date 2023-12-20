json.extract! achievement, :id, :summary, :job_history_id, :deep_dive, :created_at, :updated_at
json.url achievement_url(achievement, format: :json)
json.deep_dive achievement.deep_dive.to_s
