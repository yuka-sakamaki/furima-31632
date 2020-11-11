require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "全て正しく入力できていれば登録できる" do
      expect(@user).to be_valid
    end
    it "ニックネームが必須" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "メールアドレスが必須" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "メールアドレスが一意性である" do
      @user.save
      another_user = FactoryBot.build(:user,email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "パスワードが必須であること" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードは、6文字以上での入力が必須" do
      @user.password = "abc123"
      @user.password_confirmation = "abc123"
      expect(@user).to be_valid
    end
    it "パスワードは、半角英数字混合での入力が必須" do

    end
    it "パスワードとパスワード（確認用）、値の一致が必須であること" do
      @user.password = "abc123"
      @user.password_confirmation = "def456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
      @user.last_name = "山田"
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.last_name = "山田"
      @user.first_name = "tarou"
      @user.valid?
      expect(@user.errors.full_messages)
    end
    it "ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること" do
      @user.last_name_katakana = "ヤマダ"
      @user.first_name_katakana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name katakana can't be blank")
    end
    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.last_name_katakana = "ヤマダ"
      @user.first_name_katakana = "tarou"
      @user.valid?
      expect(@user.errors.full_messages)
    end
    it "生年月日が必須であること" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end