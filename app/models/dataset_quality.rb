class DatasetQuality < ApplicationRecord
  belongs_to :dataset

  enum status: { unknown: 0, low: 5, normal: 10 }
end
