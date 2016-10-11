Rails.application.routes.draw do

#トップ画面
  root 'top#index'

#ユーザー機能
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

#質問機能
  resources :questions

end
