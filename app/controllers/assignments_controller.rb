class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show]

  def index
  	@assignments = current_user.assignments
  end

  def show
  end

  private
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end
end
