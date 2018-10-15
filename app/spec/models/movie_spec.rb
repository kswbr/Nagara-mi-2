require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "データベース接続ができている場合" do
    context "データの保存が" do
     let(:movie) {
        feed = create(:feed, title:"TestFeedTitle")
        build(:movie, feed_id: feed.id)
      }
      it "正常にできる" do
        expect(movie).to be_valid
        expect(movie.feed.title).to eq "TestFeedTitle"
      end
    end
    context "データが全て未公開の場合" do
      before do
        create(:movie_unpublish)
        create(:movie_unpublish)
      end
      it "公開データの数は0になる" do
        expect(Movie.all.published.count).to eq 0
      end
    end
  end
end
