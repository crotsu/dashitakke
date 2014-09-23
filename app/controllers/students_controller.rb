class StudentsController < ApplicationController
  before_action :set_paper, only: [:show]

  def index
  	@papers = current_user.papers
  end

  def show
  	@source = Source.new
  end

  private
    def set_paper
      @paper = Paper.find(params[:id])
    end

end
