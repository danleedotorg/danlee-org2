class JobHistory < ApplicationRecord
  validates_presence_of :start_date
  has_many :achievements
  has_and_belongs_to_many :technologies
end
