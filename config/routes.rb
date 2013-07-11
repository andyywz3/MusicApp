MusicApp::Application.routes.draw do
  resources :bands do
      resources :albums, only: :index
  end

  resources :albums, except: :index do
    resources :tracks, only: :index
  end
  resources :tracks, except: :index

  get 'bands/:id/tracks' => 'bands#tracks', as: "bands_tracks"
  post 'track/:id/note' => 'tracks#add_note', as: "add_note"
  delete 'track/note/:id' => 'tracks#delete_note', as: "delete_note"


  # get 'albums/new' => 'albums#new'
  # post 'albums' => 'albums#create', as: "albums_create"
  #
  # get 'bands/:band_id/tracks/new' => 'tracks#new', as: "tracks_new"
  # post 'bands/:band_id/tracks' => 'tracks#create', as: "tracks_create"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
