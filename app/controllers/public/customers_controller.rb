class Public::CustomersController < ApplicationController

  def show
  end

  def edit
  end

  def update
    current_customer.update(customer_params)
    redirect_to my_page_path(current_customer)
  end

  def unsubscribe
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to '/'
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end
end
