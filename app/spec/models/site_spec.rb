require 'rails_helper'

RSpec.describe Site, type: :model do
  describe "データベース接続ができている場合" do
    context "データの保存が" do
      let(:site) {
        build(:site, name: "TestSite")
      }
      it "正常にできる" do
        expect(site).to be_valid
        expect(site.name).to eq "TestSite"
      end
    end
  end
end
