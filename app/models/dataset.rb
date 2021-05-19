class Dataset < ApplicationRecord
  after_create_commit :save_digest

  has_one_attached :image

  has_many :dataset_positions, dependent: :destroy

  def save_digest
    return if digest.present?

    self.image.blob.open do |f|
      update_columns(digest: Digest::MD5.hexdigest(f.read))
    end
  end

  def has_dataset_positions?
    dataset_positions.size > 0
  end
end
