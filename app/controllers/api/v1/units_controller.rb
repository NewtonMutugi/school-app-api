class Api::V1::UnitsController < ApplicationController
  before_action :authenticate_user!
  def index
    @units = Unit.all
    render json: @users, status: :ok
  end

  def create
    @units = Unit.new(unit_params)

    if @units.save
      render @units.to_json, status: :created
    else
      render json: @units.errors, status: :unprocessable_entity
    end
  end

  def update
    @units = Unit.find(params[:id])

    if @units.update(unit_params)
      render json: @units
    else
      render json: {errors: @units.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @units = Unit.find(params[:id])

    if @units.destroy
      head :ok
    else
      head :unprocessable_entity
    end
  end

  private

  def units_params
    params.require(:unit).permit(:name, :venue, :day_of_week, :completed, :facilitator)
  end

end
