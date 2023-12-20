module Admin
  class JobHistoriesController < Admin::RootController
    before_action :set_job_history, only: %i[ show edit update destroy ]

    # GET /job_histories or /job_histories.json
    def index
      @job_histories = JobHistory.all
    end

    # GET /job_histories/1 or /job_histories/1.json
    def show
    end

    # GET /job_histories/new
    def new
      @job_history = JobHistory.new
    end

    # GET /job_histories/1/edit
    def edit
    end

    # POST /job_histories or /job_histories.json
    def create
      @job_history = JobHistory.new(job_history_params)

      respond_to do |format|
        if @job_history.save
          format.html { redirect_to job_history_url(@job_history), notice: "Job history was successfully created." }
          format.json { render :show, status: :created, location: @job_history }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @job_history.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /job_histories/1 or /job_histories/1.json
    def update
      respond_to do |format|
        if @job_history.update(job_history_params)
          format.html { redirect_to job_history_url(@job_history), notice: "Job history was successfully updated." }
          format.json { render :show, status: :ok, location: @job_history }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @job_history.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /job_histories/1 or /job_histories/1.json
    def destroy
      @job_history.destroy!

      respond_to do |format|
        format.html { redirect_to job_histories_url, notice: "Job history was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_job_history
      @job_history = JobHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_history_params
      params.require(:job_history).permit(:company_name, :job_title, :start_date, :end_date)
    end
  end
end