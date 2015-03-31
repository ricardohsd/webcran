Rails.application.routes.draw do
  root "packages#index"
  get 'packages/:id', to: 'packages#show', as: 'package'
end
