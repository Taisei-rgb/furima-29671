require 'rails_helper'

RSpec.describe UserAddress, type: :model do
  describe "#create" do
    before do
      @user_address = FactoryBot.build(:user_address)
    end
    context '商品購入がうまくいくとき' do
      it '全ての値が正常であれば、購入できること' do
        expect(@user_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it '郵便番号が空だと登録できない' do
        @user_address.post_number = ''
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include("Post number can't be blank")
      end
      it '発送元の地域についての情報が0だと登録できない' do
        @user_address.prefecture_id = 0
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it '市町村が空だと登録できない' do
        @user_address.city = ''
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと登録できない' do
        @user_address.house_number = ''
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空だと登録できない' do
        @user_address.phone_number = ''
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '郵便番号にハイフンが必須であること' do
        @user_address.post_number = '1234567'
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include("Post number is invalid")
      end
      it '電話番号にはハイフンは不要であること' do
        @user_address.phone_number = '090-1234-1234'
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号は11桁以内であること' do
        @user_address.phone_number = '090123412345'
        @user_address.valid?
        expect(@user_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
