class Crop
  # @param [OpenCV::CvMat] mat
  # @return [OpenCV::CvMat]
  # イカメーターの部分のみを切り取る
  def self.ikatako_meter(mat)
    mat.sub_rect(450, 0, 1000, 130)
  end

  # @return [OpenCV::CvMat]
  # 余裕をもっておイカメーターの部分のみを切り取る
  def self.ikatako_meter_with_padding(mat)
    mat.sub_rect(450, 15, 1000, 115)
  end
end
