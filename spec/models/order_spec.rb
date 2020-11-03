require 'rails_helper'
describe Order do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入情報の入力' do
    context '購入がうまくいく時' do
      it '商品情報入力が正しく全て記述されていれば登録ができる' do
        expect(@order).to be_valid
      end
    end
  end
end
