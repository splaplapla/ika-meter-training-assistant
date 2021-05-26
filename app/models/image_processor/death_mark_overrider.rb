module ImageProcessor
  class DeathMarkOverrider
    class DeathMark
      def self.make
        return @template if @template
        mat = OpenCV::CvMat.load "#{Rails.root}/lib/assets/deatch_mark_source.jpg"
        origina_ikatako_meter = Crop.old_style_ikatako_meter(mat)
        # deatch markのばってんの色
        lower = OpenCV::CvScalar.new(0x5D, 0x5D, 0x5D, 0)
        upper = OpenCV::CvScalar.new(0x6B, 0x6B, 0x6B, 0)
        monocolor_ikatako_meter = origina_ikatako_meter.in_range(lower, upper)
        @template = monocolor_ikatako_meter.sub_rect(735, 30, 40, 40)
      end

      cattr_accessor :template, default: make
    end

    # @param [OpenCV::CvMat] origina_ikatako_meter
    def initialize(mat)
      @ikatako_meter = mat
    end

    # 後続処理のためにデスアイコンを白く塗りつぶす
    # @return [Array<Array>] killed_enemies_xes_range
    def override!
      # テンプレートマッチングのために色を抜く
      lower = OpenCV::CvScalar.new(0x50, 0x50, 0x50, 0)
      upper = OpenCV::CvScalar.new(0x78, 0x78, 0x78, 0)
      killed_enemies = []

      8.times do # プレイヤーは最大8人なので
        ikatako_meter_for_matching = @ikatako_meter.in_range(lower, upper)
        result = ikatako_meter_for_matching.match_template(DeathMark.template, :sqdiff_normed)
        min_score, max_score, min_point, max_point = result.min_max_loc
        if min_score == 1.0 && max_score == 1.0
          break
        else
          # 白塗りの範囲を小さくしたい
          # -10しないとマスクしたイカタコが1要素として認識されない。膨張したときに太すぎになってしまう
          point1 = OpenCV::CvPoint.new(min_point.x - 20, min_point.y - 20)
          point2 = OpenCV::CvPoint.new(min_point.x + DeathMark.template.width + 10, min_point.y + DeathMark.template.height + 20) # 縦なら固定値のハードコードで問題ない
          @ikatako_meter.rectangle!(point1, point2, color: OpenCV::CvColor::White, thickness: -1)

          killed_enemies << ((min_point.x)..(point2.x))
        end
      end

      return killed_enemies
    end
  end
end
