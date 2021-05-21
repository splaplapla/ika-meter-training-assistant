class Crop
  # @param [OpenCV::CvMat] mat
  # @return [OpenCV::CvMat]
  # イカメーターの部分のみを切り取る
  def self.ikatako_meter(mat)
    x = mat.width / 3.8 # 505
    y = mat.rows / 50
    mat.sub_rect(x, y, mat.width / 2.0, mat.rows / 11)
  end
end
