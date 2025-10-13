class TrimestersController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_trimester, only: [:show, :edit, :update, :destroy]

  def index
    @trimesters = Trimester.all
  end

  def show
  end

  def new
    @trimester = Trimester.new
  end

  def create
    @trimester = Trimester.new(trimester_params)
    if @trimester.save
      redirect_to @trimester, notice: 'Trimester created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @trimester.update(trimester_params)
      redirect_to @trimester, notice: 'Trimester updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @trimester.destroy
    redirect_to trimesters_path, notice: 'Trimester deleted.'
  end

  private

  def set_trimester
    @trimester = Trimester.find(params[:id])
  end

  def trimester_params
    params.require(:trimester).permit(:name, :application_deadline, :start_date, :end_date)
  end
end