require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '商品登録がうまくいくとき' do
      it '価格の範囲が、¥300~¥9999999の間であること' do
        expect(@item).to be_valid
      end
    end
    context '商品登録がうまくいかないとき' do
      it '商品名が空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明文が空だと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーの情報が空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
      it '商品の状態についての情報が空だと登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Status is not a number')
      end
      it '配送料の負担についての情報が空だと登録できない' do
        @item.shipping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee is not a number')
      end
      it '発送元の地域についての情報が空だと登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end
      it '発送までの日数についての情報が空だと登録できない' do
        @item.waiting_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Waiting date is not a number')
      end
      it '価格についての情報が空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格は半角数字のみ入力可能であること' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '画像は1枚ないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
