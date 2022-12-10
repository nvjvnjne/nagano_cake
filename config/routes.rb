Rails.application.routes.draw do

  #顧客用
  #URL /customers/sign_in
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  root to: 'public/homes#top'
  get '/about'=>'public/homes#about', as: 'about'
  scope module: :public do
    resources :items, only: [:index, :show]
  end

  #管理者用
  #URL /admin/sign_in
    devise_for :admin, skip: [:registrations, :passwords], controllers: {
      sessions: "admin/sessions"
    }
    get '/admin'=>'admin/homes#top', as: 'admin_top'
    namespace :admin do
      resources :items, only: [:edit, :index, :new, :show]
    end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
