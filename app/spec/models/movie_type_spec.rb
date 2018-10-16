require 'rails_helper'

RSpec.describe SiteType, type: :model do
  describe "データベース接続ができている場合" do
    context "データの保存が" do
      let(:movie_type) {
        build(:movie_type, title: "TestMovieType")
      }
      it "正常にできる" do
        expect(movie_type).to be_valid
        expect(movie_type.title).to eq "TestMovieType"
      end
    end
  end
end
