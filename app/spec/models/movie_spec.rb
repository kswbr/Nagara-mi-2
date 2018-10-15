require 'rails_helper'

RSpec.describe Movie, type: :model do

  describe "データベース接続ができている場合" do
    context "データの保存が" do
     let(:movie) {
        @feed = build(:feed) do |f|
          f.title = "TestSite"
        end
        @feed.save()
        @movie_type = create(:movie_type)
        Movie.new(title:"TestMovie",url:"test-movie.com",feed_id: @feed.id, movie_type_id: @movie_type.id)
      }
      it "正常にできる" do
        expect(movie).to be_valid
        expect(movie.feed.title).to eq "TestSite"
        expect(movie.publish).to eq true
      end
    end
  end


end
