class Dataset < ApplicationRecord
  has_one_attached :image

  has_many :dataset_positions, dependent: :destroy
  has_many :dataset_temporary_positions, dependent: :destroy

  has_one :dataset_quality, dependent: :destroy

  after_create_commit :save_digest
  before_create :prepare_dataset_quality

  def has_dataset_positions?
    dataset_positions.size > 0
  end

  def r
    min = OpenCV::CvSize.new(64, 64)
    scale_factor = 1.01
    detector = OpenCV::CvHaarClassifierCascade::load("/Users/koji/src/ika-meter-training-assistant/tmp/model/cascade.xml")
    filename = ActiveStorage::Blob.service.send(:path_for, self.image.key)
    image = OpenCV::CvMat.load(filename)
    croped_image = Crop.ikatako_meter_with_padding(image)
    ActiveRecord::Base.transaction do
      self.dataset_temporary_positions.delete_all
      ImageProcessor::DeathMarkOverrider.new(croped_image).override!
      detector.detect_objects(croped_image, min_size: min, min_neighbors: 5, scale_factor: scale_factor).each do |rect|
        self.dataset_temporary_positions.create!(x: rect.top_left.x + 450, y: rect.top_left.y, width: rect.bottom_right.x - rect.top_left.x, height: rect.bottom_right.y)
      end
    end
  end

  private

  def save_digest
    return if digest.present?

    self.image.blob.open do |f|
      update_columns(digest: Digest::MD5.hexdigest(f.read))
    end
  end

  def prepare_dataset_quality
    build_dataset_quality(status: :normal)
  end
end
