Rails.application.routes.draw do


  get 'sessions/new'

  #get 'users/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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

  resources :users
  resources :items do
    get :upvote, on: :member
  end
  get    'signup' => 'users#new', as: 'signup'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'cart/add/:id/(:qty)' => 'cart#add', as: 'cart_add'
  delete 'card/delete/:id' => 'cart#remove', as: 'cart_remove'

  # get 'items' => 'items#index', as: 'items'
  # get 'items/:id(.:format)' => 'item#show'

  #   get 'auth/reg' => 'auth#reg', as: 'reg'
  #  post 'auth/reg' => 'auth#do_reg', as: 'do_reg'

  # get 'auth/login' => 'auth#login', as: 'login'
  #post 'auth/do_login' => 'auth#do_login', as: 'do_login'
end
