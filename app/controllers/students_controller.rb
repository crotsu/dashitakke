class StudentsController < ApplicationController
  def index
  	@papers = current_user.papers
  end

  def show
  end
end
