class DatasetPositionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @dataset = Dataset.find(params[:dataset_id])
    ActiveRecord::Base.transaction do
      @dataset.dataset_positions.delete_all
      params[:positions].split(/,/).each_slice(4).map do |point|
        @dataset.dataset_positions.create!(x: point[0], y: point[1], width: point[2], height: point[3])
      end
    end
    head :ok
  end
end
