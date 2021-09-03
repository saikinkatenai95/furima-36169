require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
 
  describe "商品登録" do
    context "商品登録できる時" do
      it "全ての項目が入力されていれば登録できる" do
        expect(@item).to be_valid
      end
    end
    
    context "商品登録できない時" do
      it "nameの入力が空だと登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      
      it "infoの入力が空だと登録できない" do
        @item.info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      
      it "image画像が空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "categoryの入力が1番だと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "itemoconditionの入力が1番だと登録できない" do
        @item.itemcondition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Itemcondition can't be blank")
      end

      it "deliveryfeeの入力が1番だと登録できない" do
        @item.deliveryfee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliveryfee can't be blank")
      end

      it "prefectureの入力が0番だと登録できない" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "readtimeの入力が1番だと登録できない" do
        @item.readtime_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Readtime can't be blank")
      end

      it "priceの入力が空だと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceの入力が300未満だと登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "priceの入力が100000000以上だと登録できない" do
        @item.price = "100000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it "priceに半角数字以外が含まれている場合出品できない" do
        @item.price = "１０００en"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "userが紐づいていなければ出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    
    end
  end
end