class Technology < ApplicationRecord
  belongs_to :tech_category
  has_and_belongs_to_many :job_histories
end