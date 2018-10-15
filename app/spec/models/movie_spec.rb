require 'rails_helper'

RSpec.describe Movie, type: :model do

  describe "データベース接続テスト" do
    it "動画データの保存確認" do
      site_type = SiteType.create(name:"TestType");
      site = Site.create(name:"TestSite",url:"test-url.com",site_type_id:site_type.id);
      feed = Feed.create(title:"TestSite",url:"test-url-1.com",site_id: site.id);
      movie1 = Movie.create(title:"TestMovie",url:"test-movie.com",feed_id: feed.id);
      expect(movie1.feed.title).to eq "TestSite"
      expect(movie1.publish).to eq true
      expect(movie1.movie_id).to eq nil
      expect(movie1.play_time).to eq nil
    end
  end


end
