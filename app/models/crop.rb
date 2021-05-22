class Crop
  # @param [OpenCV::CvMat] mat
  # @return [OpenCV::CvMat]
  # イカメーターの部分のみを切り取る
  def self.ikatako_meter(mat)
    mat.sub_rect(450, 0, 1000, 130)
  end
end
