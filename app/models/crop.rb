class Crop
  # @param [OpenCV::CvMat] mat
  # @return [OpenCV::CvMat]
  # イカメーターの部分のみを切り取る
  def self.ikatako_meter(mat)
    x = mat.width / 3.8 # 505
    y = 0
    mat.sub_rect(x, y, mat.width / 2.0, (mat.rows / 11 + mat.rows / 50))
  end
end
