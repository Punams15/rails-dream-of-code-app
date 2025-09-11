class TrimestersController < ApplicationController
  before_action :set_trimester, only: [:edit, :update]

  # GET /trimesters/:id/edit
  def edit
  end

  # PATCH/PUT /trimesters/:id
  def update
    if @trimester.update(trimester_params)
      redirect_to root_path, notice: "Trimester updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_trimester
    @trimester = Trimester.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render plain: "Trimester not found", status: :not_found
  end

  def trimester_params
    params.require(:trimester).permit(:application_deadline)
  end
end
