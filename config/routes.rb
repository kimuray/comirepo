Rails.application.routes.draw do
  root 'statics#top'

  get '/auth/:provider/callback' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
