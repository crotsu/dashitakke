class PapersController < ApplicationController
  before_action :set_paper, only: [:show, :edit, :update, :destroy, :set, :reset]

  def index
    @papers = Paper.all
    @user = current_user
  end

  def show
    @question = Question.new
    if @paper.questions.maximum(:index) == nil
      @question.index = 1
    else
      @question.index = @paper.questions.maximum(:index)+1
    end
  end

  def new
    @paper = Paper.new
    if Paper.maximum(:index) == nil
      @paper.index = 1
    else
      @paper.index = Paper.maximum(:index)+1
    end
  end

  def edit
  end

  def create
    @paper = Paper.new(paper_params)

    respond_to do |format|
      if @paper.save
        format.html { redirect_to @paper, notice: 'Paper was successfully created.' }
        format.json { render :show, status: :created, location: @paper }
      else
        format.html { render :new }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @paper.update(paper_params)
        format.html { redirect_to @paper, notice: 'Paper was successfully updated.' }
        format.json { render :show, status: :ok, location: @paper }
      else
        format.html { render :edit }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @paper.destroy
    respond_to do |format|
      format.html { redirect_to papers_url, notice: 'Paper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set
    @paper.update(set: true)
    flash[:notice] = @paper.given_date.strftime("%Y年 %m月 %d日") + "付のアンケートを出題しました．"
    respond_to do |format|
      format.html { redirect_to action: :index }
    end
  end

  def reset
    @paper.update(set: false)
    flash[:notice] = @paper.given_date.strftime("%Y年 %m月 %d日") + "付のアンケートを取り消しました．"
    respond_to do |format|
      format.html { redirect_to action: :index }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paper
      @paper = Paper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paper_params
      params.require(:paper).permit(:index, :given_date, :set)
    end
end