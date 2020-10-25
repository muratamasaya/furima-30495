require 'rails_helper'
describe Item do
  before do
      @item = FactoryBot.build(:item)
  end
  
  describe '商品出品情報の入力' do
   context '出品がうまくいく時' do
     it '商品情報入力が正しく全て記述されていれば登録ができる' do
       expect(@item).to be_valid
     end
   end

   context '出品がうまくいかない時' do
    it 'imageがないと登録ができない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと登録ができない' do
        @item.product = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end
      it '商品の説明が空だと登録ができない' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが選択されてないと登録ができない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
      it '商品の状態が選択されてないと登録ができない' do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number")
      end
      it '配送料の負担が選択されてないと登録ができない' do
        @item.delivery_charge_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank", "Delivery charge is not a number")
      end
      it '配送元の地域が選択されてないと登録ができない' do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
      end
      it '発送までの日数が選択されてないと登録ができない' do
        @item.delivery_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank", "Delivery day is not a number")
      end
      it '販売価格が空だと登録ができない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が３００円未満だと登録ができない' do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字で¥300〜9,999,999円で入力してください")
      end
      it '販売価格が10,000,000円以上だと登録ができない' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字で¥300〜9,999,999円で入力してください")
      end
      it '販売価格が半角数字以外だと登録ができない' do
        @item.price = "４００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字で¥300〜9,999,999円で入力してください")
      end
    end
  end
end
