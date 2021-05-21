class DatasetsController < ApplicationController
  def index
    @datasets = Dataset.includes(:dataset_positions).distinct.where(ignore: false)
    if params[:dataset_positions] == "has"
      @datasets = @datasets.joins(:dataset_positions)
    elsif params[:dataset_positions] == "none"
      @datasets = @datasets.where(dataset_positions: { id: nil })
    end
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
