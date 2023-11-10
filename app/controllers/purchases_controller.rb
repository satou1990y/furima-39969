class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root_path, only: :index

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_address = PurchaseAddress.new
    
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
       @purchase_address.save
       redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end


  private

  def purchase_params
  params.require(:purchase_address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id,item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
     amount: @item.price,  
     card: purchase_params[:token],    
     currency: 'jpy' 
   )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root_path
    @purchase = Purchase.where(item: @item)
    if @item.user == current_user
      redirect_to root_path
    elsif @purchase.present?
      redirect_to root_path
    end
    
  end

end

