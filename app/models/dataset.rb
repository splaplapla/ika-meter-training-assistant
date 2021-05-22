class Dataset < ApplicationRecord
  has_one_attached :image

  has_many :dataset_positions, dependent: :destroy
  has_many :dataset_temporary_positions, dependent: :destroy

  has_one :dataset_quality, dependent: :destroy
  has_one :dataset_temp, dependent: :destroy

  after_create_commit :save_digest
  before_create :prepare_dataset_quality

  def has_dataset_positions?
    dataset_positions.size > 0
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
