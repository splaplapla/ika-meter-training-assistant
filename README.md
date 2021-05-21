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
Build.execute

# トレーニング
Create.execute
```
