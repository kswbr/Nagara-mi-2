require 'rails_helper'

RSpec.describe Youtube, type: :lib do
  describe "ライブラリの読み込みができている場合" do
    it "trueを返す" do
      expect(defined?(Youtube)).to be_truthy
    end
    context "parseIdを呼び出すと" do
      let (:id) { Youtube.parseId("https://www.youtube.com/embed/Xdfci6b0hpE") }
      it "YoutubeIdが取得できる" do
        expect(id).to eq "Xdfci6b0hpE"
      end
    end
    context "execDataApiを呼び出すと" do
      let (:data) { Youtube.execDataApi("Xdfci6b0hpE") }
      it "Youtubeのデータが取得できる" do
        expect(data).to be_a(Object)
        expect(data).to be_has_key(:etag)
      end
    end

  end
end
