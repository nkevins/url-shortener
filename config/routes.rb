Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'links#new'
  post '/', to: 'links#create', as: 'create_short'
  get '/:id', to: 'links#resolve', as: 'resolve'
end
