module Admin
  class JobHistoriesTechnologiesController < ApplicationController
    before_action :set_job_histories_technologies, only: %i[ show edit update destroy ]

    # GET /job_histories_technologies or /job_histories_technologies.json
    def index
      @job_histories_technologies = JobHistoriesTechnologies.eager_load(:job_history, :technology => :tech_category).all
    end

    # GET /job_histories_technologies/1 or /job_histories_technologies/1.json
    def show
    end

    # GET /job_histories_technologies/new
    def new
      @job_histories_technologies = JobHistoriesTechnologies.new
      @technologies = Technology.eager_load(:tech_category).all
      @job_histories = JobHistory.all
    end

    # GET /job_histories_technologies/1/edit
    def edit
      @technologies = Technology.eager_load(:tech_category).all
      @job_histories = JobHistory.all
    end

    # POST /job_histories_technologies or /job_histories_technologies.json
    def create
      @job_histories_technologies = JobHistoriesTechnologies.new(job_histories_technologies_params)

      respond_to do |format|
        if @job_histories_technologies.save
          format.html { redirect_to admin_path, notice: "Job histories technologies was successfully created." }
          format.json { render :show, status: :created, location: @job_histories_technologies }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @job_histories_technologies.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /job_histories_technologies/1 or /job_histories_technologies/1.json
    def update
      respond_to do |format|
        if @job_histories_technologies.update(job_histories_technologies_params)
          format.html { redirect_to job_histories_technologies_url(@job_histories_technologies), notice: "Job histories technologies was successfully updated." }
          format.json { render :show, status: :ok, location: @job_histories_technologies }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @job_histories_technologies.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /job_histories_technologies/1 or /job_histories_technologies/1.json
    def destroy
      @job_histories_technologies.destroy!

      respond_to do |format|
        format.html { redirect_to job_histories_technologies_index_url, notice: "Job histories technologies was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_job_histories_technologies
      @job_histories_technologies = JobHistoriesTechnologies.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_histories_technologies_params
      params.require(:job_histories_technologies).permit(:job_history_id, :technology_id)
    end
  end
end
