require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録ができるとき' do
      it 'nickname、first_name、family_name、first_kana、family_kana、email、password、password_confirmation、birthdayが存在すれば登録できること' do
        expect(@user).to be_valid
      end

      it 'passwordが7文字以上であれば登録できること' do
        @user.password = 'S111111'
        @user.password_confirmation = 'S111111'
        @user.valid?
        expect(@user).to be_valid
      end

      it 'passwordが7文字以上で、英数字の組み合わせであれば登録できること' do
        @user.password = 'a123456'
        @user.password_confirmation = 'a123456'
        @user.valid?
        expect(@user).to be_valid
      end

      it 'family_nameが全角文字であれば登録できること' do
        @user.family_name = '山田'
        @user.valid?
        expect(@user).to be_valid
      end

      it 'first_nameが全角文字であれば登録できること' do
        @user.first_name = '太郎'
        @user.valid?
        expect(@user).to be_valid
      end

      it 'family_name_kanaが全角カナ文字であれば登録できること' do
        @user.family_name_kana = 'ヤマダ'
        @user.valid?
        expect(@user).to be_valid
      end

      it 'first_name_kanaが全角カナ文字であれば登録できること' do
        @user.first_name_kana = 'タロウ'
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録ができない時' do
      it 'nicknameがない場合は登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailがない場合は登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに＠がない場合は登録できないこと' do
        @user.email = 'testexample'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordがない場合は登録できないこと' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '11111'
        @user.password_confirmation = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが数字のみの場合は登録できないこと' do
        @user.password = '1234567'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Password is invalid. Include both letters and numbers')
      end

      it 'passwordが英文字のみの場合は登録できないこと' do
        @user.password = 'abcdefg'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Password is invalid. Include both letters and numbers')
      end

      it 'password_confirmationがない場合は登録できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordとpassword_confirmationが一致していない場合は登録できないこと' do
        @user.password = 'abcd123'
        @user.password_confirmation = '1234abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'family_nameがない場合は登録できないこと' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'first_nameがない場合は登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'family_name_kanaがない場合は登録できないこと' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'first_name_kanaがない場合は登録できないこと' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'birth_dayがない場合は登録できないこと' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '苗字（全角）に半角文字が含まれていると登録できない' do
        @user.family_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid. Input full-width characters')
      end

      it '名前（全角）に半角文字が含まれていると登録できない' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters')
      end

      it '苗字（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.family_name_kana = 'やま田tar!'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid. Input full-width katakana characters')
      end

      it '名前（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.first_name_kana = 'やま田tar!'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
      end
    end
  end
end
