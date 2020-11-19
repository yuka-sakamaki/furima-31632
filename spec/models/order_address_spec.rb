require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '配送先住所' do
    before do
      @address = FactoryBot.build(:order_address)
    end

    context '正しく保存できる時' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@address).to be_valid
      end
      it 'building_nameが空でも保存できる' do
        @address.building_name = nil
        expect(@address).to be_valid
      end
    end

    context '正しく保存できない時' do
      it 'postal_codeが空だと保存できないこと' do
        @address.postal_code = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @address.postal_code = '1234567'
        @address.valid?
        expect(@address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @address.prefecture = 0
        @address.valid?
        expect(@address.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it 'cityが空だと保存できないこと' do
        @address.city = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end
      it 'cityが全角でないと保存できないこと' do
        @address.city = 'abc'
        @address.valid?
        expect(@address.errors.full_messages).to include('City is invalid. Input full-width characters.')
      end
      it 'house_numberが空だと保存できないこと' do
        @address.house_number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @address.phone_number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが数字でないと登録できないこと' do
        @address.phone_number = 'abc'
        @address.valid?
        expect(@address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが12桁では登録できない' do
        @address.phone_number = '090123456789'
        @address.valid?
        expect(@address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空では登録できないこと' do
        @address.token = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
