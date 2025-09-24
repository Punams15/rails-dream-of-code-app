class AssignmentsController < ApplicationController
  before_action :set_assignment, only: %i[ show edit update destroy submit ]
  before_action :require_mentor, only: %i[ new create edit update destroy ]
  before_action :require_student, only: %i[ submit ]

  # Students + Mentors
  def index
    @assignments = Assignment.all
  end

  def show
  end

  # Mentors only
  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assignment_params)
    if @assignment.save
      redirect_to @assignment, notice: "Assignment created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end
  def update
    if @assignment.update(assignment_params)
      redirect_to @assignment, notice: "Assignment updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @assignment.destroy
    redirect_to assignments_path, notice: "Assignment deleted."
  end

  # Students only
  def submit
    # student submits their work here
    flash[:notice] = "Assignment submitted!"
    redirect_to @assignment
  end

  private

  def set_assignment
    @assignment = Assignment.find(params[:id])
  end

  def assignment_params
    params.require(:assignment).permit(:title, :description, :due_date, :course_id)
  end
end
