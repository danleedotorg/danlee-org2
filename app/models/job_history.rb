class JobHistory < ApplicationRecord
  validates_presence_of :start_date
  has_many :achievements
end
