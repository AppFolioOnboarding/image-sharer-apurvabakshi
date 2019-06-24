Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'application#home'
  root 'home#index'
  get 'home/index'
  resources :images
  # get 'images/show_my_new_image'
  get('tags/:tag', to: 'images#index', as: :tag)
end
