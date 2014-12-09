class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource

  # GET /questions
  # GET /questions.json
  def index
    if @cur_page.nil? 
      cp = Question.find_by_num("-1") 
      if cp.nil?
        @cur_page = 1
      else
        @cur_page = cp.page.abs
      end
    end
    @q = Question.search(params[:q])
    @q.page_eq =@cur_page unless params[:q]
    @questions = @q.result(distinct: true)
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        @nextnum = @question.num + 1
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render action: 'index', status: :created, location: @question }
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    params[:question][:topic_ids] ||=[]
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:num, :page, :level, :qtext, :shortAnswer, :answer, :notes, :presenter1, :presenter2, 
        :qimage, :remove_qimage, :aimage, :remove_aimage, {:topic_ids => []}, :page_cont)
    end
end
