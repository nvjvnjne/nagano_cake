Rails.application.routes.draw do

  #顧客用
  #URL /customers/sign_in
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  root to: 'public/homes#top'
  get '/about'=>'public/homes#about', as: 'about'
  #会員の実装
  get 'customers/my_page'=>'public/customers#show', as: 'my_page'
  get 'customers/information/edit'=>'public/customers#edit', as: 'customers_edit'
  patch 'customers/information'=>'public/customers#update', as: 'customers_information'
  get 'customers/unsubscribe'=>'public/customers#unsubscribe', as: 'customers_unsubscribe'
  patch 'customers/withdraw'=>'public/customers#withdraw', as: 'customers_withdraw'
  #注文の実装
  post 'orders/confirm'=>'public/orders#confirm', as: 'order_confirm'
  get 'orders/complete'=>'public/orders#complete', as: 'order_complete'
  #カート全削除
  delete 'cart_items/destroy_all'=>'public/cart_items#destroy_all' , as: 'cart_item_destroy_all'
  #
  scope module: :public do
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy]
    resources :addresses, only: [:create, :index, :edit, :update, :destroy]
    resources :orders, only: [:create, :index, :show, :new]
  end

  #管理者用
  #URL /admin/sign_in
    devise_for :admin, skip: [:registrations, :passwords], controllers: {
      sessions: "admin/sessions"
    }
    get '/admin'=>'admin/homes#top', as: 'admin_top'
    namespace :admin do
      resources :items, only: [:edit, :index, :new, :create, :show, :update]
      resources :customers, only: [:edit, :index, :show, :update]
      resources :orders, only: [:show, :update]
      resources :genres, only: [:create, :index, :edit, :update]
    end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
