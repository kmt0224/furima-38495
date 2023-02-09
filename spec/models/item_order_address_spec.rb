require 'rails_helper'

RSpec.describe ItemOrderAddress, type: :model do
  describe '寄付情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      sleep(0.1)
      @item_order_address = FactoryBot.build(:item_order_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item_order_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @item_order_address.building_name = ''
        expect(@item_order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @item_order_address.postal_code = ''
        @item_order_address.valid?
        expect(@item_order_address.errors.full_messages).to include("Postal code can't be blank",
                                                                    'Postal code is invalid. Include hyphen(-)')
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @item_order_address.postal_code = '1234567'
        @item_order_address.valid?
        expect(@item_order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureが1であると保存できないこと' do
        @item_order_address.prefecture_id = 1
        @item_order_address.valid?
        expect(@item_order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと保存できないこと' do
        @item_order_address.municipality = ''
        @item_order_address.valid?
        expect(@item_order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @item_order_address.house_number = ''
        @item_order_address.valid?
        expect(@item_order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @item_order_address.phone_number = ''
        @item_order_address.valid?
        expect(@item_order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは9桁以下の場合は保存できない' do
        @item_order_address.phone_number = '123456789'
        @item_order_address.valid?
        expect(@item_order_address.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'phone_numberは12桁以上の場合は保存できない' do
        @item_order_address.phone_number = '123456789012'
        @item_order_address.valid?
        expect(@item_order_address.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'phone_numberに全角文字が含まれている場合保存できない' do
        @item_order_address.phone_number = '０３１２３４５６７８'
        @item_order_address.valid?
        expect(@item_order_address.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'tokenが空だと保存できないこと' do
        @item_order_address.token = ''
        @item_order_address.valid?
        expect(@item_order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @item_order_address.user_id = nil
        @item_order_address.valid?
        expect(@item_order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと保存できないこと' do
        @item_order_address.item_id = nil
        @item_order_address.valid?
        expect(@item_order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
