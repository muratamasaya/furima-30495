require 'rails_helper'
describe Order do
  before do
    @order_item = FactoryBot.build(:order_item)
  end

  describe '商品購入情報の入力' do
    context '購入がうまくいく時' do
      it '商品情報入力が正しく全て記述されていれば登録ができる' do
        expect(@order_item).to be_valid
      end
      it '建物名が空でも登録ができる' do
        @order_item.building_name = nil
        expect(@order_item).to be_valid
      end
    end
  end

  context '購入がうまくいかない時' do
    it 'tokenが空では購入ができない' do
      @order_item.token = nil
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が空では購入ができない' do
      @order_item.post_code = nil
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("Post code can't be blank")
    end
    it '郵便番号にハイフンが入ってないと購入ができない' do
      @order_item.post_code = '1111111'
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include('Post code ハイフンを含め且つ７桁の数字を入力してください')
    end
    it '都道府県が選択されてないと購入ができない' do
      @order_item.prefecture_id = nil
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
    end
    it '都道府県が--を選択されていると購入ができない' do
      @order_item.prefecture_id = 1
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it '市区町村が空では購入ができない' do
      @order_item.city = nil
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空では購入ができない' do
      @order_item.address = nil
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空では購入ができない' do
      @order_item.phone_number = nil
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号が11桁以上では購入ができない' do
      @order_item.phone_number = '090111111111'
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
    end
    it '電話番号に半角数字以外が入っていると購入ができない' do
      @order_item.phone_number = '090-1111-1111'
      @order_item.valid?
      expect(@order_item.errors.full_messages).to include('Phone number 半角数字11桁以内で入力してください', 'Phone number is too long (maximum is 11 characters)')
    end
  end
end
