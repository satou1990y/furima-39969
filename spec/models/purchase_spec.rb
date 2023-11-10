require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe '購入情報の保存' do
    before do
      @item = FactoryBot.create(:item)
      @user = FactoryBot.create(:user)
      @purchase = FactoryBot.build(:purchase, item: @item, user: @user)
    end

    context '内容に問題ない場合' do
      it 'item_idとuser_idが揃っていれば保存できること' do
        expect(@purchase).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'item_idが空だと保存できないこと' do
        @purchase.item_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが空だと保存できないこと' do
        @purchase.user_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end