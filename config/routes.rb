Rails.application.routes.draw do
  root 'impressions#new'

  # 静的ページ
  get :terms, to: 'statics#terms'
  resources :inquiries, only: %w(new create)
  resources :impressions, only: :show

  # TODO: 一旦感想投稿画面だけにする
  # get '/auth/:provider/callback' => 'sessions#create'
  # delete '/logout' => 'sessions#destroy'
  # # FIXME: elementUIに埋め込んだリンクがmethodきかない
  # get '/logout' => 'sessions#destroy'
  #
  # resources :impressions, only: %w(new show destroy)
  # resources :users, only: :show

  namespace :api, { format: 'json' } do
    resources :impressions, only: :create
    resources :emotions, only: :index
    resources :comics, only: :index
  end
end
