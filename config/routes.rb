Rails.application.routes.draw do

#トップ画面
  root 'top#index'

#ユーザー機能
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :users, only: [:index,:show]
  resources :favorites, only: [:create,:destroy]
#質問機能
  resources :questions do
    resources :answers
  end

#投票機能
post 'good/:question_id' => 'votes#good', as:'good'
post 'bad/:question_id' => 'votes#bad', as:'bad'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
