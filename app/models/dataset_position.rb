class DatasetPosition < ApplicationRecord
  belongs_to :dataset

  def point
    { x: x,
      y: y,
      width: width,
      height: height,
    }
  end
end
