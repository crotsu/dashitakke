class PapersController < ApplicationController
  before_action :set_paper, only: [:show, :edit, :update, :destroy, :set, :reset]

  def index
    @papers = Paper.all
    @user = current_user
    if current_user.roles.exists?(name: 'member')
      respond_to do |format|
        format.html { redirect_to controller: :students, action: :index}
      end
    end
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
    # TODO: model/user.rbに移したい．
    User.all.each do |u|
      if u.roles.exists?(name: 'member')
        @paper.users << u
        @paper.questions.each do |q|
          @answer = Answer.new
          @answer.paper_id = @paper.id
          @answer.question_id = q.id
          @answer.user_id = u.id
          @answer.status = "UNDONE"

          if @answer.save
          else
          # TODO: エラー処理
          end
        end
      end
    end

    @paper.update(set: true)
    flash[:notice] = @paper.given_date.strftime("%Y年 %m月 %d日") + "付の課題を出題しました．"
    respond_to do |format|
      format.html { redirect_to action: :index }
    end
  end

  def reset
    @user = @paper.users
    @paper.users.delete(@user) # paperに関連づいているuserを削除（中間テーブルのレコード削除）
    @paper.update(set: false)
    @paper.answers.clear
    flash[:notice] = @paper.given_date.strftime("%Y年 %m月 %d日") + "付の課題を取り消しました．"
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
