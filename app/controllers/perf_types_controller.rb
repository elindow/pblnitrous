class PerfTypesController < ApplicationController
  before_action :set_perf_type, only: [:show, :edit, :update, :destroy]

  # GET /perf_types
  # GET /perf_types.json
  def index
    @perf_types = PerfType.all
  end

  # GET /perf_types/1
  # GET /perf_types/1.json
  def show
  end

  # GET /perf_types/new
  def new
    @perf_type = PerfType.new
  end

  # GET /perf_types/1/edit
  def edit
  end

  # POST /perf_types
  # POST /perf_types.json
  def create
    @perf_type = PerfType.new(perf_type_params)

    respond_to do |format|
      if @perf_type.save
        format.html { redirect_to @perf_type, notice: 'Perf type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @perf_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @perf_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perf_types/1
  # PATCH/PUT /perf_types/1.json
  def update
    respond_to do |format|
      if @perf_type.update(perf_type_params)
        format.html { redirect_to @perf_type, notice: 'Perf type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @perf_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perf_types/1
  # DELETE /perf_types/1.json
  def destroy
    @perf_type.destroy
    respond_to do |format|
      format.html { redirect_to perf_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perf_type
      @perf_type = PerfType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def perf_type_params
      params.require(:perf_type).permit(:ps, :pt, :as, :cq, :po, :io, :db, :question_id, :student_id)
    end
end
