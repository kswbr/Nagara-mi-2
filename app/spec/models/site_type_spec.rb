require 'rails_helper'

RSpec.describe SiteType, type: :model do
  describe "データベース接続ができている場合" do
    context "データの保存が" do
      let(:site_type) {
        build(:site_type, name: "TestSiteType")
      }
      it "正常にできる" do
        expect(site_type).to be_valid
        expect(site_type.name).to eq "TestSiteType"
      end
    end
  end
end
