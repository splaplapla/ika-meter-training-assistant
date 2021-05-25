require "fileutils"

class Create
  WIDTH_SIZE = 25 # real: 59
  HEIGHT_SIZE = 25 #  # real: 70

  class << self
    def execute(no_cache=false)
      # puts "/opt/homebrew/opt/opencv@2/bin/opencv_createsamples -info positive.dat -vec positive.vec -w #{SIZE} -h #{SIZE} -num 20000"
      # puts "/opt/homebrew/opt/opencv@2/bin/opencv_createsamples -info positive.dat -vec positive.vec -w #{SIZE} -h #{SIZE} -num 20000 -maxxangle 0 -maxyangle 0 -maxzangle 0"
      puts "/opt/homebrew/opt/opencv@2/bin/opencv_createsamples -info positive.dat -vec positive.vec -w #{WIDTH_SIZE} -h #{HEIGHT_SIZE} -num 20000"
      if no_cache
        FileUtils.rm_rf "tmp/model"
        FileUtils.mkdir_p "tmp/model"
      end

      # puts "/opt/homebrew/opt/opencv@3/bin/opencv_traincascade -data tmp/model -vec positive.vec -bg negative.dat -numPos #{num_pos} -numNeg #{num_neg} -w #{WIDTH_SIZE} -h #{HEIGHT_SIZE} -mode BASIC -numThreads 4 -bt DAB -maxFalseAlarmRate 0.1 -minHitRate 0.97 -precalcValBufSize 3048 -precalcIdxBufSize 3048 -featureType LBP"
      # puts "/opt/homebrew/opt/opencv@3/bin/opencv_traincascade -data tmp/model -vec positive.vec -bg negative.dat -numPos #{num_pos} -numNeg #{num_neg} -w #{WIDTH_SIZE} -h #{HEIGHT_SIZE} -baseFormatSave -mode BASIC -numThreads 4 -bt DAB -maxFalseAlarmRate 0.1 -minHitRate 0.97 -precalcValBufSize 4048 -precalcIdxBufSize 4048"
      # puts "/opt/homebrew/opt/opencv@3/bin/opencv_traincascade -data tmp/model -vec positive.vec -bg negative.dat -numPos #{num_pos} -numNeg #{num_neg} -w #{WIDTH_SIZE} -h #{HEIGHT_SIZE} -baseFormatSave -numThreads 4 -maxFalseAlarmRate 0.1 -minHitRate 0.97 -precalcValBufSize 4048 -precalcIdxBufSize 4048"
      puts "/opt/homebrew/opt/opencv@3/bin/opencv_traincascade -data tmp/model -vec positive.vec -bg negative.dat -numPos #{num_pos} -numNeg #{num_neg} -w #{WIDTH_SIZE} -h #{HEIGHT_SIZE} -baseFormatSave -numThreads 4 -precalcValBufSize 4048 -precalcIdxBufSize 4048"
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
