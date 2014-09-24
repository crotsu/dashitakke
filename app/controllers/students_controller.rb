class StudentsController < ApplicationController
  before_action :set_student, only: [:show]

  def index
  	@papers = current_user.papers
  end

  def show
  	@source = Source.new
  end

  private
    def set_student
      @paper = Paper.find(params[:id])
    end

    def student_params
      params.require(:paper).permit(:index, :given_date, :set)
    end
end
