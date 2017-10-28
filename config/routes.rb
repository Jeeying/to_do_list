Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :lists
  root "lists#index"
  delete '/lists' ,to: 'lists#deleteall', as: 'deleteall'
  patch '/lists/:id/finished' ,to: 'lists#finished', as: 'finished'
end
