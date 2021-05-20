require "fileutils"

class Build
  def self.execute
    build_negative
    build_positive
  end

  def self.build_positive
    FileUtils.rm_rf "./tmp/positive.dat"
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

    File.write "tmp/positive.dat", files.join("\n")
  end

  def self.build_negative
    # cleanup
    FileUtils.rm_rf "./tmp/negative.dat"
    FileUtils.mkdir_p "tmp/data/pos"
    Dir.glob("./tmp/data/neg/*.jpg").map { |filepath| FileUtils.rm filepath }

    negative_files = []

    Dir.glob("tmp/negative/**/*.jpg").map.with_index(1) do |org_filepath, index|
      filepath = "#{Rails.root}/tmp/data/neg/#{index}.jpg"
      FileUtils.cp org_filepath, "./#{filepath}"
      negative_files << "#{Dir.pwd}/#{filepath}"
    end
    File.write "tmp/negative.dat", negative_files.join("\n")
  end
end
