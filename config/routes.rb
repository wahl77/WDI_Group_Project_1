WDIGroupProject1::Application.routes.draw do


  root :to => "likes#my_matches"

  match "home" => "static_pages#home", as:"home"

  match "/login" => "linked_in#index", as:"login"
  match "/logout" => "linked_in#destroy", as:"logout"
  match "/linked_in/callback" => "linked_in#callback"
  match "/profile" => "users#profile"
  match "/add_to_friends/:friend_id" => "likes#add"
  match "/remove_friends/:friend_id" => "likes#delete"
  match "/my_profile" => "users#my_profile", as:"my_profile"
  match "/profile/delete" => "users#destroy", as:"delete_profile"
  get "/messages" => 'messages#inbox', as:"inbox"
  match "/compose" => 'messages#compose', as:"compose"
  post "/messages" => 'messages#create'
  delete "/messages/:id" => 'messages#destroy'
  match "/settings" => 'static_pages#settings'
  match "/invite" => 'static_pages#invite'

  match "/my_profile_path" => 'users#my_profile'
  match "/matches" => 'likes#browse_match'
  match "/my_matches" => 'likes#my_matches'

  match "/message_from/:id" => 'messages#message_from'
  match "/message_compose/:id" => 'messages#message_compose'

  match "/edit_locations" => 'locations#edit'
  resources :users

  resources :locations

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
