class DatasetTemporaryPosition < ApplicationRecord
  belongs_to :dataset

  # TODO module
  def point
    { x: x,
      y: y,
      width: w,
      height: h,
    }
  end

  def w
    width
  end

  def h
    height
  end

  def too_small?
    width < 30 || height < 30
  end

  # 小さいと不正なので消す
  def cleanup
    destroy if too_small?
  end
end
