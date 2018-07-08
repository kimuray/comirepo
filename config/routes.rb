Rails.application.routes.draw do
  root 'statics#top'

  get '/auth/:provider/callback' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  # FIXME: elementUIに埋め込んだリンクがmethodきかない
  get '/logout' => 'sessions#destroy'

  resources :impressions, only: %w(new show destroy)
  resources :users, only: :show
  resources :inquiries, only: %w(new create)

  namespace :api, { format: 'json' } do
    resources :impressions, only: :create
    resources :emotions, only: :index
    resources :comics, only: :index
  end
end
