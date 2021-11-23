require 'rails_helper'

RSpec.describe BuyOrder, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @buy_order = FactoryBot.build(:buy_order, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@buy_order).to be_valid
    end
    it 'building_nameが空でも保存できること' do
      @buy_order.building_name = ''
      expect(@buy_order).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'post_codeが空では保存ができないこと' do
      @buy_order.post_code = ''
      @buy_order.valid?
      expect(@buy_order.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @buy_order.post_code = '1234567'
      @buy_order.valid?
      expect(@buy_order.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end
    it 'cityが空では保存ができないこと' do
      @buy_order.city = ''
      @buy_order.valid?
      expect(@buy_order.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空では保存ができないこと' do
      @buy_order.address = ''
      @buy_order.valid?
      expect(@buy_order.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberがハイフンを含まない正しい形式でないと保存ができないこと' do
      @buy_order.phone_number = '123-4567'
      @buy_order.valid?
      expect(@buy_order.errors.full_messages).to include('Phone number is invalid. Not Include hyphen(-)')
    end
    it 'phone_numberが空では保存ができないこと' do
      @buy_order.phone_number = ''
      @buy_order.valid?
      expect(@buy_order.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'area_idを選択していないと保存ができないこと' do
      @buy_order.area_id = 1
      @buy_order.valid?
      expect(@buy_order.errors.full_messages).to include("Area can't be blank")
    end
    it 'tokenが空では登録できないこと' do
      @buy_order.token = nil
      @buy_order.valid?
      expect(@buy_order.errors.full_messages).to include("Token can't be blank")
    end
    it 'phone_numberが空では保存ができないこと' do
      @buy_order.phone_number = ''
      @buy_order.valid?
      expect(@buy_order.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号が10桁以上でなければ保存できないこと' do
      @buy_order.phone_number = '09012345'
      @buy_order.valid?
      expect(@buy_order.errors.full_messages).to include("Phone number is invalid. Not Include hyphen(-)")
    end
    it '電話番号が12桁以上では保存できないこと' do
      @buy_order.phone_number = '09012345678901'
      @buy_order.valid?
      expect(@buy_order.errors.full_messages).to include("Phone number is invalid. Not Include hyphen(-)")
    end
    it '電話番号が半角数値のみでなければ保存できないこと' do
      @buy_order.phone_number = 'aaa000'
      @buy_order.valid?
      expect(@buy_order.errors.full_messages).to include("Phone number is invalid. Not Include hyphen(-)")
    end
    it 'ユーザーが紐付いていなければ保存できないこと' do
      @buy_order.user_id = nil
      @buy_order.valid?
      expect(@buy_order.errors.full_messages).to include("User can't be blank")
    end
    it '商品が紐付いていなければ保存できないこと' do
      @buy_order.item_id = nil
      @buy_order.valid?
      expect(@buy_order.errors.full_messages).to include("Item can't be blank")
    end
    it '都道府県が空では保存できないこと' do
      @buy_order.area_id = ''
      @buy_order.valid?
      expect(@buy_order.errors.full_messages).to include("Area can't be blank")
    end
  end
end
