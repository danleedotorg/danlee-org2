module Admin

  class TechCategoriesController < Admin::RootController
    before_action :set_tech_category, only: %i[ show edit update destroy ]

    # GET /tech_categories or /tech_categories.json
    def index
      @tech_categories = TechCategory.all
    end

    # GET /tech_categories/1 or /tech_categories/1.json
    def show
    end

    # GET /tech_categories/new
    def new
      @tech_category = TechCategory.new
    end

    # GET /tech_categories/1/edit
    def edit
    end

    # POST /tech_categories or /tech_categories.json
    def create
      @tech_category = TechCategory.new(tech_category_params)

      respond_to do |format|
        if @tech_category.save
          format.html { redirect_to tech_category_url(@tech_category), notice: "Tech category was successfully created." }
          format.json { render :show, status: :created, location: @tech_category }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @tech_category.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /tech_categories/1 or /tech_categories/1.json
    def update
      respond_to do |format|
        if @tech_category.update(tech_category_params)
          format.html { redirect_to tech_category_url(@tech_category), notice: "Tech category was successfully updated." }
          format.json { render :show, status: :ok, location: @tech_category }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @tech_category.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /tech_categories/1 or /tech_categories/1.json
    def destroy
      @tech_category.destroy!

      respond_to do |format|
        format.html { redirect_to tech_categories_url, notice: "Tech category was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_tech_category
      @tech_category = TechCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tech_category_params
      params.require(:tech_category).permit(:name)
    end
  end
end