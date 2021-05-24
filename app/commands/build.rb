require "fileutils"

class Build
  def self.execute
    FileUtils.mkdir_p "tmp/models"
    build_negative
    build_positive
  end

  def self.build_negative
    # cleanup
    FileUtils.rm_rf "./negative.dat"
    FileUtils.mkdir_p "tmp/data/pos"
    Dir.glob("./tmp/data/neg/*.jpg").map { |filepath| FileUtils.rm filepath }

    files = []
    Dir.glob("#{Rails.root}/lib/assets/negative/**/*").map.with_index(1) do |org_file_path, index|
      if org_file_path =~ /\/([^\/]+?)\.(png|jpg)/
        next if $1.start_with?("_")
      end
      mat = OpenCV::CvMat.load(org_file_path)
      if mat.width == 1920 && mat.height == 1080
        mat = Crop.ikatako_meter(mat)
      end
      dist_file_path = "#{Rails.root}/tmp/data/neg/#{index}.jpg"
      mat.save dist_file_path
      # FileUtils.cp org_file_path, filepath
      files << org_file_path
    end

    File.write "negative.dat", files.join("\n")
  end

  def self.build_positive
    FileUtils.rm_rf "./positive.dat"
    FileUtils.mkdir_p "tmp/data/neg"
    Dir.glob("tmp/data/pos/*.jpg").map { |filepath| FileUtils.rm filepath }

    files = []
    # .where(dataset_qualities: { status: :normal })
    # 品質をカットしてデータを出力できる
    datasets = Dataset.where(ignore: false).joins(:dataset_positions, :dataset_quality).includes(:dataset_positions).with_attached_image.distinct
    if ENV["IGNORE_LOW_SAMPLES"]
      datasets = datasets.where(dataset_qualities: { status: :normal })
    end
    datasets.find_each(batch_size: 400) do |dataset, index|
      org_file_path = ActiveStorage::Blob.service.send(:path_for, dataset.image.key)
      mat = OpenCV::CvMat.load(org_file_path)
      mat = Crop.ikatako_meter(mat)

      dist_file_path = "#{Rails.root}/tmp/data/pos/d#{dataset.id}.jpg"
      mat.save dist_file_path
      # FileUtils.cp org_file_path, dist_file_path
      metadata = dataset.dataset_positions.map(&:output_for_dat_and_ika_meter_offset)
      files << "#{dist_file_path} #{dataset.dataset_positions.size} #{metadata.join(" ")}"
    end

    File.write "positive.dat", files.join("\n")
  end
end
