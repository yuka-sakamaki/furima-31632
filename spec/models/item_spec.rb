require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
   context '商品出品がうまくいくとき' do
    it "全て正しく入力できていれば登録できる" do
      expect(@item).to be_valid
    end
   end
  end

    context '商品出品がうまくいかないとき' do
      it "商品名がないと登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品画像がないと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品説明がないと登録できない" do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "カテゴリーの情報がないと登録できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態がないと登録できない" do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "配送料の負担についての情報がないと登録できない" do
        @item.postage_payer_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer can't be blank")
      end
      it "発送元の地域についての情報がないと登録できない" do
        @item.prefecture_code_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture code can't be blank")
      end
      it "発送までの日数についての情報がないと登録できない" do
        @item.days_to_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it "価格についての情報がないと登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格の範囲が¥300~¥9,999,999の間でないと登録できない" do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格が半角数値でないと登録できない" do
        @item.price = "９００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
     end
  end
end
