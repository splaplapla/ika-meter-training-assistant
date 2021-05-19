class Dataset < ApplicationRecord
  has_one_attached :image

  has_many :dataset_positions, dependent: :destroy

  before_save do
    save_digest
  end

  def save_digest
    self.digest = Digest::MD5.hexdigest(self.image.attachment.download)
  end
end
