# IkaMeterTrainingAssistant
* スプラトゥーン2の試合中に表示されるイカメーターの生存アイコンを検出する、分類器を生成するリポジトリです
* このリポジトリには、正解要素のマーキングを支援WEBアプリと、opencv_traincascadeへの入力データを生成する機能を同梱しています

![image](https://user-images.githubusercontent.com/1664497/123417849-436e3f80-d5f3-11eb-95dd-14be049cb5de.png)
![image](https://user-images.githubusercontent.com/1664497/123417642-fab68680-d5f2-11eb-8ddf-3895b52cf0a3.png)
![image](https://user-images.githubusercontent.com/1664497/123417888-53861f00-d5f3-11eb-8466-a84d2de68b96.png)
![image](https://user-images.githubusercontent.com/1664497/123417674-04d88500-d5f3-11eb-8475-b44727e1384e.png)

* 実際に生成した分類器の結果です。精度(体感)は80%くらいです。過学習している気がするし、パラメータ調整の試行錯誤が足りない気もする

## TODO
* webpackerを後で頑張る
  * https://patorash.hatenablog.com/entry/2020/07/02/165320
  * https://github.com/webpack-contrib/expose-loader
* build datをfind_in_batchesにして省メモリ化する

## 使い方
* bundle install
* install mysql@5.7
* リストアする
* bundle exec rails s
* ブラウザを開いてマーキングする
* `bundle exec rails r Build.execute && bundle exec rails r "Create.execute true" | sh`
* `tmp/model/cascade.xml` を使う

## 運用
### ダンプ
```shell
bin/dump_db.sh
```

リストア

```shell
bin/restore_db.sh
```

### 画像を取り込む
```ruby
Dir.glob("#{Rails.root}/lib/assets/20210521/*jpg").map.with_index(1) do |filename, index|
  file = File.open(filename)
  digest = Digest::MD5.hexdigest(file.read)
  if Dataset.find_by(digest: digest)
    Rails.logger.warn "skip!!!!!!!!!"
  else
    name = "#{Time.now.tap { |x| break "#{x.to_i}#{x.usec}" }}.jpg"
    file.rewind
    Dataset.create(image: { io: file, filename: name }, digest: digest )
  end
end
```

### このリポジトリで生成した分類器を使って、あらかじめマークした状態で画像を取り込む
```ruby
min = OpenCV::CvSize.new(64, 64)
scale_factor = 1.1
detector = OpenCV::CvHaarClassifierCascade::load("#{Rails.root}/ika-meter-training-assistant/tmp/model/cascade.xml")
Dir.glob("#{Rails.root}/lib/assets/0531/*.jpg").map do |filename|
  file = File.open(filename)
  digest = Digest::MD5.hexdigest(file.read)
  if Dataset.find_by(digest: digest)
    Rails.logger.warn "skip!!!!!!!!!"
  else
    image = OpenCV::CvMat.load(filename).copy
    croped_image = Crop.ikatako_meter_with_padding(image)
    name = "#{Time.now.tap { |x| break "#{x.to_i}#{x.usec}" }}.jpg"
    file.rewind
    ActiveRecord::Base.transaction do
      ImageProcessor::DeathMarkOverrider.new(croped_image).override!
      dataset = Dataset.create!(image: { io: file, filename: name }, digest: digest )
      detector.detect_objects(croped_image, min_size: min, min_neighbors: 5, scale_factor: scale_factor).each do |rect|
        dataset.dataset_temporary_positions.create!(x: rect.top_left.x + 450, y: rect.top_left.y, width: rect.bottom_right.x - rect.top_left.x, height: rect.bottom_right.y)
      end
    end
  end
end
```

### cascade.xml を出力する
```ruby
# DBからpositive.datを生成
be rails r Build.execute

# トレーニング
be rails r "Create.execute true" | sh
```

## Links
* OpenCVでSplatoonのイカ分類器を作ってみた
  * https://qiita.com/haseshin/items/31fc5b42c4d73b574cd0
* opencv_traincascade についての説明が書いている
  * https://rest-term.com/archives/3131/
  * https://www.pro-s.co.jp/blog/system/opencv/6471
* 仏像顔分類器
  * https://midoriit.com/2017/10/%e7%9f%b3%e4%bb%8f%e7%94%a8%e9%a1%94%e6%a4%9c%e5%87%ba%e5%99%a8%e3%81%ae%e4%bd%9c%e6%88%90.html
* OpenCVリファレンス
  * http://opencv.jp/opencv-1.0.0/document/opencvref_cv_detection.html
* 分類器を造ってみた記事
  * https://qiita.com/takanorimutoh/items/5bd88f3d17239a147581
* イカちゃんを物体検知した yolo
  * https://qiita.com/knyrc/items/b57a40a4291fbd870c98
* featureType
  * https://qiita.com/kenmaro/items/1b5f23187cc46b4f28c0
* たちぶんるい
  * https://yoshoku.hatenablog.com/entry/2017/10/01/083028
  * https://github.com/yoshoku/rumale
* http://opencv.jp/opencv-2.2/py/objdetect_cascade_classification.html
  * パラメータの説明
* minneighborsの説明
  * http://workpiles.com/2015/04/opencv-detectmultiscale-minneighbors/
* scalefactorの説明
  http://workpiles.com/2015/04/opencv-detectmultiscale-scalefactor/
* detectMultiScaleの説明
  * https://qiita.com/FukuharaYohei/items/ec6dce7cc5ea21a51a82
* 公式
  * https://docs.opencv.org/master/dc/d88/tutorial_traincascade.html
