require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it '会員情報入力が全て記述されていれば登録ができる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'nick_nameが空だと登録ができない' do
        user = FactoryBot.build(:user)
        user.nick_name = ''
        user.valid?
        expect(user.errors.full_messages).to include("Nick name can't be blank")
      end
      it 'emailが空だと登録ができない' do
        user = FactoryBot.build(:user)
        user.email = ''
        user.valid?
        expect(user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに＠が入ってないと登録ができない' do
        user = FactoryBot.build(:user)
        user.email = 'testes.com'
        user.valid?
        expect(user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合は登録ができない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空だと登録ができない' do
        user = FactoryBot.build(:user)
        user.password = ''
        user.valid?
        expect(user.errors.full_messages).to include("Password can't be blank")
      end
      it 'password(確認)が空だと登録ができない' do
        user = FactoryBot.build(:user)
        user.password_confirmation = ''
        user.valid?
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが英字だけだと登録ができない' do
        user = FactoryBot.build(:user)
        user.password = 'aaaaaa'
        user.password_confirmation = 'aaaaaa'
        user.valid?
        expect(user.errors.full_messages).to include('Password ６文字以上の半角英数字を入力してください')
      end
      it 'passwordに記号が入ってると登録ができない' do
        user = FactoryBot.build(:user)
        user.password = 'aa1::1'
        user.password_confirmation = 'aa11::1'
        user.valid?
        expect(user.errors.full_messages).to include('Password ６文字以上の半角英数字を入力してください')
      end
      it 'passwordとpassword（確認）が一致しないと登録ができない' do
        user = FactoryBot.build(:user)
        user.password = 'a111111'
        user.password_confirmation = 'aaa111'
        user.valid?
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前（family_name）が空だと登録ができない' do
        user = FactoryBot.build(:user)
        user.family_name = ''
        user.valid?
        expect(user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'お名前（first_name）が空だと登録ができない' do
        user = FactoryBot.build(:user)
        user.first_name = ''
        user.valid?
        expect(user.errors.full_messages).to include("First name can't be blank")
      end
      it 'お名前（family_name）が英字だと登録ができない' do
        user = FactoryBot.build(:user)
        user.family_name = 'JON'
        user.valid?
      end
      it 'お名前（first_name）が英字だと登録ができない' do
        user = FactoryBot.build(:user)
        user.first_name = 'JON'
        user.valid?
      end
      it 'お名前（family_name）が半角だと登録ができない' do
        user = FactoryBot.build(:user)
        user.family_name = 'ﾔﾏﾀﾞ'
        user.valid?
      end
      it 'お名前（first_name）が半角だと登録ができない' do
        user = FactoryBot.build(:user)
        user.first_name = 'ﾀﾛｳﾞ'
        user.valid?
      end
      it 'お名前（family_name_kana）が空だと登録ができない' do
        user = FactoryBot.build(:user)
        user.family_name_kana = ''
        user.valid?
        expect(user.errors.full_messages).to include("Family name kana can't be blank", 'Family name kana is invalid')
      end
      it 'お名前（first_name_kana）が空だと登録ができない' do
        user = FactoryBot.build(:user)
        user.first_name_kana = ''
        user.valid?
        expect(user.errors.full_messages).to include("First name kana can't be blank", 'First name kana is invalid')
      end
      it 'お名前（family_name_kana）がカタカナ以外だと登録ができない' do
        user = FactoryBot.build(:user)
        user.family_name_kana = '吉岡'
        user.valid?
        expect(user.errors.full_messages).to include('Family name kana is invalid')
      end
      it 'お名前（first_name_kana）がカタカナ以外だと登録ができない' do
        user = FactoryBot.build(:user)
        user.first_name_kana = '拓也'
        user.valid?
        expect(user.errors.full_messages).to include('First name kana is invalid')
      end
      it 'birth_dayが空だと登録ができない' do
        user = FactoryBot.build(:user)
        user.birth_day = ''
        user.valid?
        expect(user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
