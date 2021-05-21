class DatasetPosition < ApplicationRecord
  belongs_to :dataset

  after_create_commit :cleanup

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

  def output_for_dat(x: )
    "#{x} #{y} #{w} #{h}"
  end

  def output_for_dat_and_ika_meter_offset
    x_offset = [x, 505].min
    output_for_dat(x: x - x_offset)
  end

  def too_small?
    width < 30 || height < 30
  end

  # 小さいと不正なので消す
  def cleanup
    destroy if too_small?
  end
end
