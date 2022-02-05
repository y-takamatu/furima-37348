require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it ' nicknameとemail、passwordとpassword_confirmatio、first_nameとlast_name、first_name_kanaとlast_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールを入力してください"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it '@を含まないemailは登録できない' do
        @user.email = '1234com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'abcgefghi'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは英字と数字の両方を含めてください')
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '12345678'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは英字と数字の両方を含めてください')
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'Ａbc1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは英字と数字の両方を含めてください')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'お名前(全角)は、名字と名前がそれぞれ必須であること。（名字）' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'お名前(全角)は、名字と名前がそれぞれ必須であること。（名前）' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。(名字)' do
        @user.first_name = 'ｱﾍﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は全角で入力してください')
      end
      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。（名前）' do
        @user.last_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字は全角で入力してください')
      end
      it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること。（名字カナ）' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（カナ）を入力してください")
      end
      it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること。（名前カナ）' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（カナ）を入力してください")
      end
      it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。（名字カナ）' do
        @user.first_name_kana = 'ｱﾍﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（カナ）は全角カナで入力してください')
      end
      it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。（名前カナ）' do
        @user.last_name_kana = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字（カナ）は全角カナで入力してください')
      end
      it '生年月日が必須であること。' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end
