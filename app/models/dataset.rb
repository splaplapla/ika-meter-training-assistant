class Dataset < ApplicationRecord
  has_one_attached :image

  has_many :dataset_positions, dependent: :destroy

  after_create_commit :save_digest

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
end
