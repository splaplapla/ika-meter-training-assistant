require "fileutils"

class Create
  class << self
    def execute
      puts "/opt/homebrew/opt/opencv@2/bin/opencv_createsamples -info positive.dat -vec positive.vec -w 100 -h 100 -num 2000"
      # FileUtils.rm_rf "tmp/model"
      # FileUtils.mkdir_p "tmp/model"
      puts "/opt/homebrew/opt/opencv@3/bin/opencv_traincascade -data tmp/model -vec positive.vec -bg negative.dat -numPos #{num_pos} -numNeg #{num_neg} -w 100 -h 100 -baseFormatSave"
    end

    private

    def num_pos
      File.open("positive.dat").readlines.count
    end

    def num_neg
      File.open("negative.dat").readlines.count
    end
  end
end
