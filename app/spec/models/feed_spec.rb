require 'rails_helper'

RSpec.describe Feed, type: :model do
  describe "データベース接続ができている場合" do
    context "データの保存が" do
      let(:feed) {
        build(:feed, title: "TestFeed")
      }
      it "正常にできる" do
        expect(feed).to be_valid
        expect(feed.title).to eq "TestFeed"
      end
    end
    context "saveFeedを呼び出すと" do
      let(:entry) { build(:feed, site_id: nil) }
      let(:site) { create(:site) }
      it "データ保存できる" do
        expect(Feed.saveFeed(site.id,entry)).to be_truthy
      end
    end
  end
end
