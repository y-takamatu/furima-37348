require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できる時' do
      it 'name、description、category_id、condition_id、delivery_charge_id、prefecture_id、transport_day_id,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できない時' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "画像を入力してください"
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の説明を入力してください"
      end
      it 'category_idが空では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーを入力してください"
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態を入力してください"
      end
      it 'delivery_charge_idが空では登録できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担を入力してください"
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域を入力してください"
      end
      it 'transport_day_idが空では登録できない' do
        @item.transport_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数を入力してください"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格を入力してください"
      end
      it 'priceが300以下なら登録できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include '販売価格は300〜9,999,999の間で入力してください'
      end
      it 'priceが9,999,999以上なら登録できない' do
        @item.price = '99999991'
        @item.valid?
        expect(@item.errors.full_messages).to include '販売価格は300〜9,999,999の間で入力してください'
      end
      it 'priceが全角なら登録できない' do
        @item.price = '５０００'
        @item.valid?
        expect(@item.errors.full_messages).to include '販売価格は半角数字で入力してください'
      end
      it 'userが紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Userを入力してください'
      end
    end
  end
end
