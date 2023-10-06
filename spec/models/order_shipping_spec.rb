require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '購入情報の保存' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
    end

    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipping).to be_valid
      end
      it '建物名がなくても保存できること' do
        @order_shipping.building = ''
        expect(@order_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空では登録できないこと' do
        @order_shipping.token = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end
      it 'postが空だと保存できないこと' do
        @order_shipping.post = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Post can't be blank")
      end
      it 'post_codeが(-)なしだと保存できないこと' do
        @order_shipping.post = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Post is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが空だと保存できないこと' do
        @order_shipping.prefecture_id = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idに「---」が選択されている場合は保存できないこと' do
        @order_shipping.prefecture_id = 1
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'villageが空だと保存できないこと' do
        @order_shipping.village = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Village can't be blank")
      end
      it 'explanationが空だと保存できないこと' do
        @order_shipping.explanation = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'telephoneが空だと保存できないこと' do
        @order_shipping.telephone = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneに(-)がある場合は保存できないこと' do
        @order_shipping.telephone = '090-1234-5678'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Telephone is invalid")
      end
      it 'telephoneが9桁以下では保存できないこと' do
        @order_shipping.telephone = '090123456'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Telephone is invalid')
      end
      it 'telephoneが12桁以上では保存できないこと' do
        @order_shipping.telephone = '090123456789'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Telephone is invalid')
      end
      it 'user_id（購入者）が空だと購入できない' do
        @order_shipping.user_id = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'item_id（購入商品）が空だと購入できない' do
        @order_shipping.item_id = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end