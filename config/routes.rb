Rails.application.routes.draw do

  #顧客用
  #URL /customers/sign_in
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  root to: 'public/homes#top'
  get '/about'=>'public/homes#about', as: 'about'

  #管理者用
  #URL /admin/sign_in
  namespace :admin do
    devise_for :admins, skip: [:registrations, :passwords], controllers: {
      sessions: "admin/sessions"
    }
    get '/admin'=>'admin/homes#top', as: 'admin_top'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
