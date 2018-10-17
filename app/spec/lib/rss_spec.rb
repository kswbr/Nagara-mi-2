require 'rails_helper'

RSpec.describe RSS, type: :lib do
  describe "ライブラリの読み込みができている場合" do
    it "trueを返す" do
      expect(defined?(RSS)).to be_truthy
    end

    before do
      class Foo
        attr_accessor :title, :published
        def initialize
          @title = "test_title"
          @published = DateTime::now
        end
      end
      entry = Foo.new
      allow(Feedjira::Feed).to receive(:fetch_and_parse).and_return([entry])
    end

    context "readEntriesを呼び出すと" do
      let (:entries) {
        RSS.readEntries("https://www.cinra.net/feed/news?genre=music")
      }
      it "rssのentriesが取得できる" do
        expect(entries.length).to eq 1
      end
    end

    context "第二引数を未来の日付にしてreadEntriesを呼び出すと" do
      let (:entries) {
        RSS.readEntries("https://www.cinra.net/feed/news?genre=music",DateTime::tomorrow)
      }
      it "rssのentriesが取得できない" do
        expect(entries.length).to eq 0
      end
    end
  end
end
