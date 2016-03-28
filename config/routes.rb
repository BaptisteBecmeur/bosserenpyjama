Rails.application.routes.draw do


  resources :friendships

  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
    resources :users, only: [:show, :index, :destroy]


  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'legal', to: 'pages#legal'
  get 'contact', to: 'pages#contact'
  get 'formation', to: 'pages#formation'
  get 'start', to: 'pages#start'
  get 'profile', to: 'pages#profile'

  root to: 'pages#home'

  resources :posts do
    resources :categories
      resources :comments
  end

  resources :favs, only: [:index, :destroy]

  post 'favs/:post_id', to: 'favs#create', as: "post_favs"
  get 'favs', to: 'favs#index'
  delete 'favs/:post_id', to: 'favs#destroy'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
