require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nickname、email、passwordとpassword_confirmation、last_name、first_name、last_kana_name、first_kana_name、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "nameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したメールアドレスは登録できない" do
        @user.save
        @user2 = FactoryBot.build(:user)
        @user2.email = @user.email
        @user2.valid?
        expect(@user2.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードが6文字未満では登録できない" do
        @user.password = 'a12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be under six characters")
      end
      it "パスワードは、半角英数字混合での入力が必須であること" do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "パスワードとパスワード（確認用）は、値の一致が必須であること" do
        @user.password = 'aaa111'
        @user.password_confirmation = 'bbb111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが全角（漢字・ひらがな・カタカナ）以外では登録できない" do
        @user.last_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "お名前カナ(全角)は、全角（カタカナ）での入力が必須であること" do
        @user.first_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角カナ文字を使用してください")
      end
      it "last_kana_nameが空では登録できない" do
        @user.last_kana_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana name can't be blank")
      end
      it "last_kana_nameが全角（カタカナ）以外では登録できない" do
        @user.last_kana_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana name 全角カナ文字を使用してください")
      end
      it "first_kana_nameが空では登録できない" do
        @user.first_kana_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana name can't be blank")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
