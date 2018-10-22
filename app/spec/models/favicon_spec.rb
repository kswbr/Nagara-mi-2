require 'rails_helper'

RSpec.describe Favicon, type: :model do
  describe "データベース接続ができている場合" do
    context "データの保存が" do
     let(:favicon) {
        site = create(:site, name:"TestSite")
        build(:favicon, site_id: site.id)
      }
      it "正常にできる" do
        expect(favicon).to be_valid
        # expect(favicon.site.name).to eq "TestSite"
      end
    end
  end
end
