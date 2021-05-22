class DatasetsController < ApplicationController
  def index
    @datasets = Dataset.includes(:dataset_positions, :dataset_quality).with_attached_image.distinct.where(ignore: false).limit(50)
    if params[:dataset_positions] == "has"
      @datasets = @datasets.joins(:dataset_positions)
    elsif params[:dataset_positions] == "none"
      @datasets = @datasets.where(dataset_positions: { id: nil })
    elsif params[:dataset_positions] == 'temporary'
      @datasets = @datasets.joins(:dataset_temporary_positions)
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
if params[:dataset_positions] == "has" || params[:dataset_positions] == "none" || params[:dataset_positions].blank? || @dataset.dataset_temporary_positions.empty?
      @dataset_points = @dataset.dataset_positions.map(&:point).to_json
    elsif params[:dataset_positions] == 'temporary'
      @dataset_points = @dataset.dataset_temporary_positions.map(&:point).to_json
    end
  end

  private

  def dataset_params
    params.require(:dataset).permit(:image)
  end
end
