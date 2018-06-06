Rails.application.routes.draw do
  root 'statics#top'

  get '/auth/:provider/callback' => 'sessions#create'
end
