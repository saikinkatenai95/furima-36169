require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

    describe "ユーザー新規登録" do
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
          
          
        end
        
        it "firstnameが空では登録できない" do
          
          
        end
        
        it "lastname_japanaseが空では登録できない" do
          
          
        end
        
        it "firstname_japanaseが空では登録できない" do
          
          
        end
        
        it "dateが空では登録できない" do
          
          
        end
        
        it "lastnameが漢字以外では登録できない" do
          
          
        end
        
        it "firstnameが漢字以外では登録できない" do
          
          
        end
        
        it "lastname_japaneseがカタカナ以外では登録できない" do
          
          
        end
        
        it "firstname_japaneseがカタカナ以外では登録できない" do
          
          
        end

        it "passwordとpassword_confirmationが不一致では登録できない" do
        
        
        end

        it "passwordが5文字以下では登録できない" do
        
        
        end
        
        it "重複したemailが存在する場合は登録できない" do
        
        
        end

    end
  end
end