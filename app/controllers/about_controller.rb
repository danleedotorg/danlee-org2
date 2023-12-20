class AboutController < ApplicationController
  def index
    @job_histories = JobHistory.eager_load(:achievements).all
  end
end
