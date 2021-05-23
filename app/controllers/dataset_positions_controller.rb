class DatasetPositionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @dataset = Dataset.find(params[:dataset_id])
    ActiveRecord::Base.transaction do
      @dataset.dataset_positions.delete_all
      @dataset.dataset_temporary_positions.delete_all
      params[:positions].split(/,/).each_slice(4).map do |point|
        @dataset.dataset_positions.create!(x: point[0], y: point[1], width: point[2], height: point[3])
      end
    end

    if params[:dataset_positions]&.start_with? 'temporary'
      next_dataset = Dataset.joins(:dataset_temporary_positions).where("datasets.id > ?", @dataset.id).first
      if next_dataset
        render json: { next_dataset_id: next_dataset.id }
      else
        render json: {}
      end
    else
      render json: {}
    end
  end
end
