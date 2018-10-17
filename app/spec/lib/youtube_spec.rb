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
      before do
        allow(URI).to receive(:parse).and_return('stub-uri')
        allow(Net::HTTP).to receive(:get).and_return({etag: "test"}.to_json)
      end
      let (:data) {
        Youtube.execDataApi("Xdfci6b0hpE")
      }
      it "Youtubeのデータが取得できる" do
        expect(data).to be_a(Object)
        expect(data).to be_has_key(:etag)
      end
    end
    context "getYoutubeMoviesを呼び出すと" do
      let (:movies) { Youtube.getMoviesByHtml(Nokogiri.HTML('<html><body><iframe src="https://www.youtube.com/embed/KIViy7L_lo8" width="560" height="315" frameborder="0" allowfullscreen="allowfullscreen"></iframe></body></html>'))}
      it "URLの配列を返す" do
        expect(movies).to eq ["//www.youtube.com/embed/KIViy7L_lo8"]
      end
    end

    context "インスタンスを生成すると" do
      before do
        allow(Youtube).to receive(:execDataApi).and_return({:items => [{
          :snippet => {
            :thumbnails => {
              :default => {:test => "TESTOBJECT"}
            }
          },
          :contentDetails => { :duration => "PT7M27S" }
        }]})
      end
      let (:youtube) { Youtube.new("https://www.youtube.com/embed/Xdfci6b0hpE") }
      it "サムネイルが取得できる" do
        obj = {:test => "TESTOBJECT"}
        expect(youtube.getThumbnail()).to eq obj
      end
      it "再生時間が取得できる" do
        expect(youtube.getPlayTime()).to eq 447
      end
      it "YoutubeIdが取得できる" do
        expect(youtube.id).to eq "Xdfci6b0hpE"
      end
    end
  end
end
