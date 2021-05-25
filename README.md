# README
https://github.com/jiikko/ika-meter-traincascade で使うための学習支援WEBアプリです

## TODO
* webpackerを後で頑張る
  * https://patorash.hatenablog.com/entry/2020/07/02/165320
  * https://github.com/webpack-contrib/expose-loader
* negative画像を充実させる
  * バツマーク, ピンチマークあたり


## 運用
### データはリポジトリに全部保管するのでダンプする
```shell
mysqldump -uroot training_assistant_development > db/dump.sql
```

リストア

```shell
cat db/dump.sql| mysql -uroot training_assistant_development
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

### モデルを使って画像を取り込む
```ruby
detector = OpenCV::CvHaarClassifierCascade::load("/Users/koji/src/ika-meter-training-assistant/tmp/model/cascade.xml")
Dir.glob("#{Rails.root}/lib/assets/2/*jpg").map.with_index(1) do |filename, index|
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
      dataset = Dataset.create!(image: { io: file, filename: name }, digest: digest )
      detector.detect_objects(croped_image).each do |rect|
        dataset.dataset_temporary_positions.create!(x: rect.top_left.x + 450, y: rect.top_left.y, width: rect.bottom_right.x - rect.top_left.x, height: rect.bottom_right.y)
      end
    end
  end
end
```

### opencv_createsamples に食わせるために出力する
/Users/koji/src/ika-meter-traincascade

```ruby
# DBからpositive.datを生成
be rails r Build.execute
# or
IGNORE_LOW_SAMPLES=true be rails r Build.execute

# トレーニング
be rails r Create.execute | sh
or
be rails r "Create.execute true" | sh
```

* samples: 1281
  * IGNORE_LOW_SAMPLES=false, size:8はちょっとだけ
  * IGNORE_LOW_SAMPLES=false, size:9でなし
  * IGNORE_LOW_SAMPLES=false, size:10でなし
  * IGNORE_LOW_SAMPLES=false, size:11でなし
  * IGNORE_LOW_SAMPLES=false, size:12でなし
  * IGNORE_LOW_SAMPLES=false, size:13はそこそこ
  * IGNORE_LOW_SAMPLES=false, size:14でなし
  * IGNORE_LOW_SAMPLES=false, size:15でなし
  * IGNORE_LOW_SAMPLES=false, size:16すごくいい
  * IGNORE_LOW_SAMPLES=false, size:17でなし
  * IGNORE_LOW_SAMPLES=false, size:18でそこそこ検出できる
  * IGNORE_LOW_SAMPLES=false, size:19でちょっと検出できる
  * IGNORE_LOW_SAMPLES=false, size:20で検出できない
  * IGNORE_LOW_SAMPLES=false, size:21ですくないが検出できた
  * IGNORE_LOW_SAMPLES=false, size:23でそこそこ検出できた
  * IGNORE_LOW_SAMPLES=false, size:36でそこそこ検出できた

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
