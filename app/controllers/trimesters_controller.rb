class TrimestersController < ApplicationController
  before_action :require_student  # only students can access

  def index
    @trimesters = Trimester.all
  end

  def show
    @trimester = Trimester.find(params[:id])
  end

  def new
    @trimester = Trimester.new
  end

  def create
    @trimester = Trimester.new(trimester_params)
    if @trimester.save
      redirect_to @trimester, notice: "Trimester created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def trimester_params
    params.require(:trimester).permit(:name, :start_date, :end_date)
  end
end
