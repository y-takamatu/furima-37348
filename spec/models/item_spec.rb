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
      end
      it 'nameが空では登録できない' do
      end
      it 'descriptionが空では登録できない' do
      end
      it 'category_idが空では登録できない' do
      end
      it 'condition_idが空では登録できない' do
      end
      it 'delivery_charge_idが空では登録できない' do
      end
      it 'prefecture_idが空では登録できない' do
      end
      it 'transport_day_idが空では登録できない' do
      end
      it 'priceが空では登録できない' do
      end
      it 'priceが300以下なら登録できない' do
      end
      it 'priceが9,999,999以上なら登録できない' do
      end
    
    end
  end
end