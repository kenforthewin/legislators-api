Rails.application.routes.draw do
  post 'legislators', to: 'legislators#index', as: :legislators
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
