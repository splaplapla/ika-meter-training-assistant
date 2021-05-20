require "fileutils"

class Create
  def self.execute
    `/opt/homebrew/opt/opencv@2/bin/opencv_createsamples -info positive.dat -vec positive.vec -w 100 -h 100 -num 2000`
    num_pos = File.open("positive.dat").readlines.count
    num_neg = File.open("negative.dat").readlines.count
    `/opt/homebrew/opt/opencv@2/bin/opencv_traincascade -data tmp/model -vec positive.vec -bg negative.dat -numPos #{num_pos} -numNeg #{num_neg} -w 100 -h 100 -baseFormatSave`
  end
end
