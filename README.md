# README
https://github.com/jiikko/ika-meter-traincascade で使うための学習支援WEBアプリです

## TODO
* webpackerを後で頑張る
  * https://patorash.hatenablog.com/entry/2020/07/02/165320
  * https://github.com/webpack-contrib/expose-loader
* 出力するサンプルデータをイカメーターに絞る
* ika-meter-traincascade の変更を取り込む

## 運用
### データはリポジトリに全部保管するのでダンプする
```shell
mysqldump -uroot training_assistant_development > db/dump.sql
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

### opencv_createsamples に食わせるために出力する
/Users/koji/src/ika-meter-traincascade

```ruby
# DBからpositive.datを生成
be rails r Build.execute

# トレーニング
be rails r Create.execute | sh
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
