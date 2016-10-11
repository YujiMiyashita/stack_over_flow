Rails.application.routes.draw do

#ユーザー機能
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

#質問機能
  resources :questions

end
