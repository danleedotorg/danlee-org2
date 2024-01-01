class AboutController < ApplicationController
  def index
    @job_histories = JobHistory.eager_load(:achievements).order(:start_date => :desc).all
  end
end
