class DatasetsController < ApplicationController
  def index
    @datasets = Dataset.includes(:dataset_positions)
  end

  def new
    @dataset = Dataset.new
  end

  def create
    dataset = Dataset.create!(dataset_params)
    redirect_to dataset
  end

  def show
    @dataset = Dataset.find(params[:id])
  end

  private

  def dataset_params
    params.require(:dataset).permit(:image)
  end
end
