require "fileutils"

class Create
  WIDTH_SIZE = 29
  HEIGHT_SIZE = 29

  class << self
    def execute(no_cache=false)
      if no_cache
        FileUtils.rm_rf "tmp/model"
        FileUtils.mkdir_p "tmp/model"
      end
      puts "/opt/homebrew/opt/opencv@2/bin/opencv_createsamples -info positive.dat -vec positive.vec -w #{WIDTH_SIZE} -h #{HEIGHT_SIZE} -num 200000"
      puts "/opt/homebrew/opt/opencv@3/bin/opencv_traincascade -data tmp/model -vec positive.vec -bg negative.dat -numPos #{num_pos} -numNeg #{num_neg} -w #{WIDTH_SIZE} -h #{HEIGHT_SIZE} -baseFormatSave -numThreads 4 -precalcValBufSize 6048 -precalcIdxBufSize 6048"
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
