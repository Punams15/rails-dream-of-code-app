class AssignmentsController < ApplicationController
 before_action :require_login
  before_action :set_assignment, only: %i[ show edit update destroy submit ]

  # Students create submissions
  before_action :require_student, only: %i[ new create submit ]

  # Mentors edit/update submissions
  before_action :require_mentor, only: %i[ edit update ]

  def index
    @assignments = Assignment.all
  end

  def show
  end

  # Student creates submission
  def new
    @submission = @assignment.submissions.build
  end

  def create
    @submission = @assignment.submissions.build(submission_params)
    @submission.user = current_user

    if @submission.save
      redirect_to assignment_path(@assignment), notice: 'Submission created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Mentor edits submission
  def edit
    @submission = Submission.find(params[:id])
  end

  def update
    @submission = Submission.find(params[:id])
    if @submission.update(submission_params)
      redirect_to assignment_path(@submission.assignment), notice: 'Submission updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Student submits assignment
  def submit
    flash[:notice] = "Assignment submitted!"
    redirect_to @assignment
  end

  private

  def set_assignment
    @assignment = Assignment.find(params[:id])
  end

  def submission_params
    # Students submit content; mentors may later add grade/feedback separately
    params.require(:submission).permit(:content, :attachment)
  end
end