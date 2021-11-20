require 'rails_helper'

RSpec.describe BuyOrder, type: :model do
  before do
    @buy_order = FactoryBot.build(:buy_order)
  end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@buy_order).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "post_codeが空では保存ができないこと" do
      @buy_order.post_code = ''
      @buy_order.valid?
      expect(@buy_order.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @buy_order.post_code = '1234567'
      @buy_order.valid?
      expect(@buy_order.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end
    it "cityが空では保存ができないこと" do
      @buy_order.city = ''
      @buy_order.valid?
      expect(@buy_order.errors.full_messages).to include("City can't be blank")
    end
    it "addressが空では保存ができないこと" do
      @buy_order.address = ''
      @buy_order.valid?
      expect(@buy_order.errors.full_messages).to include("Address can't be blank")
    end
    it "phone_numberがハイフンを含まない正しい形式でないと保存ができないこと" do
      @buy_order.phone_number = '123-4567'
      @buy_order.valid?
      expect(@buy_order.errors.full_messages).to include("Phone number is invalid. Not Include hyphen(-)")
    end
    it "phone_numberが空では保存ができないこと" do
      @buy_order.phone_number = ''
      @buy_order.valid?
      expect(@buy_order.errors.full_messages).to include("Phone number can't be blank")
    end
    it "area_idを選択していないと保存ができないこと" do
      @buy_order.area_id = 1
      @buy_order.valid?
      expect(@buy_order.errors.full_messages).to include("Area can't be blank")
    end
  end
end