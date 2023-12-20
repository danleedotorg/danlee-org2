class Achievement < ApplicationRecord
  belongs_to :job_history
  has_rich_text :deep_dive
end
