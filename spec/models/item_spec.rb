require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

    describe '商品出品'do
    context '商品出品できる時' do
      it 'name、description、category_id、condition_id、delivery_charge_id、prefecture_id、transport_day_id,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    
    context '商品出品できない時' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include"Image can't be blank"
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include"Name can't be blank"
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include"Description can't be blank"
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include"Category can't be blank"
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include"Condition can't be blank"
      end
      it 'delivery_charge_idが空では登録できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include"Delivery charge can't be blank"
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include"Prefecture can't be blank"
      end
      it 'transport_day_idが空では登録できない' do
        @item.transport_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include"Transport day can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include"Price can't be blank"
      end
      it 'priceが300以下なら登録できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include"Price is out of setting range"
      end
      it 'priceが9,999,999以上なら登録できない' do
        @item.price = '99999991'
        @item.valid?
        expect(@item.errors.full_messages).to include"Price is out of setting range"
      end
      it 'priceが全角なら登録できない' do
        @item.price = '５０００'
        @item.valid?
        expect(@item.errors.full_messages).to include"Price is invalid. Input half-width characters"
      end
    
    end
  end
end