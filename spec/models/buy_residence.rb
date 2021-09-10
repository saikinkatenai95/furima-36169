require 'rails_helper'

RSpec.describe BuyResidence, type: :model do
  describe "購入情報の保存" do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_residence = FactoryBot.build(:buy_residence, user_id: user.id, item_id: item.id)
      sleep 0.1
    end
    context "問題なく保存できる場合" do
      it "全ての値が正しく入力されていれば保存できること" do
        expect(@buy_residence).to be_valid
      end
      it "build_nameが空でも保存できること" do
        @buy_residence.build_name = ""
        expect(@buy_residence).to be_valid
      end
      it "phone_numberが10桁でも保存できること" do
        @buy_residence.phone_number = "0123456789"
        expect(@buy_residence).to be_valid
      end
    end
    
    context "正しく保存できない場合" do
      it "tokenが空だと保存できないこと" do
        @buy_residence.token = nil
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_codeが空だと保存できないこと" do
        @buy_residence.postal_code = ""
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end
      it "postal_codeが半角ハイフンを含んだ正しい形式でないと保存できないこと" do
        @buy_residence.postal_code = "1234567"
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "prefecture_idが1だと保存できないこと" do
        @buy_residence.prefecture_id = 1
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Prefecture can't be blank")
      
      end
      it "cityが空だと保存できないこと" do
        @buy_residence.city = ""
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空だと保存できないこと" do
        @buy_residence.address = ""
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空だと保存できないこと" do
        @buy_residence.phone_number = ""
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが9桁以下だと保存できないこと" do
        @buy_residence.phone_number = "090123456"
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end
      it "phone_numberが12桁以上だと保存できないこと" do
        @buy_residence.phone_number = "012012341234"
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end
      it "phone_numberがハイフンを含んでいると保存できないこと" do
        @buy_residence.phone_number = "090-1234-1234"
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end
      it "userが紐づいていないと保存できないこと" do
        @buy_residence.user_id = nil
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("User can't be blank")
      end
      it "itemが紐づいていないと保存できないこと" do
        @buy_residence.item_id = nil
        @buy_residence.valid?
        expect(@buy_residence.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
