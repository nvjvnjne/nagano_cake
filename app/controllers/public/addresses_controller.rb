class Public::AddressesController < ApplicationController

  def index
    address = Address.new(address_params)
    address.save
    redirect_to addresses_path(address.id)
    
  end

  def edit
  end
  
  private
  
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
