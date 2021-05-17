class Dataset < ApplicationRecord
  has_one_attached :image

  has_many :dataset_positions, dependent: :destroy
end
