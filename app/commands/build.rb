require "fileutils"

class Build
  def self.execute
    FileUtils.mkdir_p "tmp/models"
    build_negative
    build_positive
  end

  def self.build_positive
    FileUtils.rm_rf "./positive.dat"
    FileUtils.mkdir_p "tmp/data/neg"
    Dir.glob("tmp/data/pos/*.jpg").map { |filepath| FileUtils.rm filepath }

    files = []
    Dataset.joins(:dataset_positions).distinct.each.with_index(1) do |dataset, index|
      org_filepath = ActiveStorage::Blob.service.send(:path_for, dataset.image.key)
      abs_file_path = "#{Rails.root}/tmp/data/pos/#{index}.jpg"
      FileUtils.cp org_filepath, abs_file_path
      metadata = dataset.dataset_positions.map(&:output_for_dat).join " "
      files << "#{abs_file_path} #{dataset.dataset_positions.size} #{metadata}"
    end

    File.write "positive.dat", files.join("\n")
  end

  def self.build_negative
    # cleanup
    FileUtils.rm_rf "./negative.dat"
    FileUtils.mkdir_p "tmp/data/pos"
    Dir.glob("./tmp/data/neg/*.jpg").map { |filepath| FileUtils.rm filepath }

    negative_files = []

    Dir.glob("#{Rails.root}/lib/assets/negative/**/*.jpg").map.with_index(1) do |org_filepath, index|
     # FileUtils.cp org_filepath, filepath
      negative_files << org_filepath
    end
    File.write "negative.dat", negative_files.join("\n")
  end
end
