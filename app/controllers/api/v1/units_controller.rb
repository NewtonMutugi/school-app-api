class Api::V1::UnitsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @units = Unit.all
    render json: @units, status: :ok
  end

  def show
    @unit = Unit.find(params[:id])
    render json: @unit
  end

  def create
    @unit = Unit.new(unit_params)

    if @unit.save
      render json: @unit, status: :created
    else
      render json: @unit.errors, status: :unprocessable_entity
    end
  end

  def update
    @unit = Unit.find(params[:id])

    if @unit.update(unit_params)
      render json: @unit
    else
      render json: @unit.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @unit = Unit.find(params[:id])
    @unit.destroy
  end

  private

  def unit_params
    params.require(:unit).permit(:name, :venue, :day_of_week, :duration, :facilitator)
  end
end
