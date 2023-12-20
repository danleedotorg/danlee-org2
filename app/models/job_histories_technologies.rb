class JobHistoriesTechnologies < ApplicationRecord
  belongs_to :job_history
  belongs_to :technology
end
