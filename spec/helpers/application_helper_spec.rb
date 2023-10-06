require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "ページタイトル" do
    it "渡した文字列を含んだページタイトルになっていること" do
      expect(full_title("test")).to eq("test - Papeterie Station")
    end

    it "引数がnilのときにPapeterie Stationになること" do
      expect(full_title(nil)).to eq("Papeterie Station")
    end

    it "引数に何も設定されてないときPapeterie Stationになること" do
      expect(full_title("")).to eq("Papeterie Station")
    end
  end
end
