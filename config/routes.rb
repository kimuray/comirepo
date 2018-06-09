Rails.application.routes.draw do
  root 'statics#top'

  get '/auth/:provider/callback' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :impressions, only: %w(new create show)

  namespace :api, { format: 'json' } do
    resources :impressions, only: [] do
      patch :upload_capture, on: :member
    end
  end
end
