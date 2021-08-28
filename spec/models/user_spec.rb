require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

    describe "ユーザー新規登録" do
      context "新規登録できる時" do
        it "入力項目全てが存在すれば登録できる" do
          @user.save
          expect(@user).to be_valid
        end

        it "passwordとpassword_confirmationが6文字以上かつ英数字が入っていれば登録できる" do
          @user.password = "i12345"
          @user.password_confirmation = "i12345"
          expect(@user).to be_valid
        end

      end

      context "新規登録できない時" do
        it "nicknameが空では登録できない" do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it "emailが空では登録できない" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it "passwordが空では登録できない" do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        
        it "lastnameが空では登録できない" do
          @user.lastname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Lastname can't be blank")
        end
        
        it "firstnameが空では登録できない" do
          @user.firstname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Firstname can't be blank")
        end
        
        it "lastname_japanaseが空では登録できない" do
          @user.lastname_japanese = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Lastname japanese can't be blank")
        end
        
        it "firstname_japanaseが空では登録できない" do
          @user.firstname_japanese = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Firstname japanese can't be blank")
        end
        
        it "birthdayが空では登録できない" do
          @user.birthday = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
        
        it "lastnameが漢字またはひらがな以外では登録できない" do
          @user.lastname = "sato"
          @user.valid?
          expect(@user.errors.full_messages).to include("Lastname is invalid")
        end
        
        it "firstnameが漢字以外またはひらがなでは登録できない" do
          @user.firstname = "taro"
          @user.valid?
          expect(@user.errors.full_messages).to include("Firstname is invalid")
        end
        
        it "lastname_japaneseがカタカナ以外では登録できない" do
          @user.lastname_japanese = "taro"
          @user.valid?
          expect(@user.errors.full_messages).to include("Lastname japanese is invalid")
        end
        
        it "firstname_japaneseがカタカナ以外では登録できない" do
          @user.firstname_japanese = "太郎"
          @user.valid?
          expect(@user.errors.full_messages).to include("Firstname japanese is invalid")
        end

        it "passwordとpassword_confirmationが不一致では登録できない" do
          @user.password = "i12345"
          @user.password_confirmation = "a12345"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it "passwordが5文字以下では登録できない" do
          @user.password = "i1234"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end

        it "passwordが英語だけでは登録できない" do
          @user.password = "abcdef"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        
        it "passwordが数字だけでは登録できない" do
          @user.password = "111111"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end

        it "重複したemailが存在する場合は登録できない" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
      end
    end
end