Rails.application.routes.draw do

  get 'users/index'

#トップ画面
  root 'top#index'

#ユーザー機能
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :users, only: [:index]
#質問機能
  resources :questions

end
