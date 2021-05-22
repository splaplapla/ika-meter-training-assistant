class DatasetQuality < ApplicationRecord
  belongs_to :dataset
  enum status: { :low, :normal }
end
