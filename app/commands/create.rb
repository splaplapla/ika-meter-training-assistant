require "fileutils"

class Create
  SIZE = 34 # ~ 40までだと判定しやすい

  class << self
    def execute(no_cache=false)
      puts "/opt/homebrew/opt/opencv@2/bin/opencv_createsamples -info positive.dat -vec positive.vec -w #{SIZE} -h #{SIZE} -num 2000"
      if no_cache
        FileUtils.rm_rf "tmp/model"
        FileUtils.mkdir_p "tmp/model"
      end
      puts "/opt/homebrew/opt/opencv@3/bin/opencv_traincascade -data tmp/model -vec positive.vec -bg negative.dat -numPos #{num_pos} -numNeg #{num_neg} -w #{SIZE} -h #{SIZE} -baseFormatSave"
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
