Rails.application.routes.draw do

  #  begin
  root 'login#new'


  #  schedullers
     post "/schedullers/confirm_client" => "schedullers#confirm_client", as: :confirm_client
     get "/schedullers/scheduller_filter_day" => "schedullers#scheduller_filter_day", as: :scheduller_filter_day
     get "/schedullers/scheduller_day" => "schedullers#scheduller_day", as: :scheduller_day
     get "/schedullers/confirm_scheduller" => "schedullers#confirm_scheduller", as: :confirm_scheduller
     get "/schedullers/alter_scheduller" => "schedullers#alter_scheduller", as: :alter_scheduller
     post "/schedullers/save_scheduller" => "schedullers#save_scheduller", as: :save_scheduller
 # end schedullers

 # attendances
    get "/attendances/attendance_day" => "attendances#attendance_day", as: :attendance_day
    get "/schedullers/attendance_filter_day" => "attendances#attendance_filter_day", as: :attendance_filter_day
    get "/attendances/filter_attendance" => "attendances#filter_attendance", as: :filter_attendance
 # attendances end

 # login
   post "/login/autentication" => "login#autentication", as: :autentication
   get "/login/home" => "login#home", as: :home
   get "/login/logout" => "login#logout", as: :logout
   get "/login/restart_login" => "login#restart_login", as: :restart_login
   post "/login/save_new_password" => "login#save_new_password", as: :save_new_password

# login end

# clients
   get "/clients/find_client" => "clients#find_clients", as: :find_clients
   get "/clients/delete_client_logic" => "clients#delete_client_logic", as: :delete_client_logic
 # clients end

# agreements
   get "/agreements/delete_agreement_logic" => "agreements#delete_agreement_logic", as: :delete_agreement_logic
# agreements and

# professionals
   get "/professionals/delete_professional_logic" => "professionals#delete_professional_logic", as: :delete_professional_logic
# professionals and

# users
   get "/users/delete_user_logic" => "users#delete_user_logic", as: :delete_user_logic
# users and

#card_operators
   get "/card_operators/delete_card_operator_logic" => "card_operators#delete_card_operator_logic", as: :delete_card_operator_logic
#card_operators end

#financials
    post "/financials/create_parcels" => "financials#create_parcels", as: :create_parcels
    get "/financials/new_parcels" => "financials#create_parcels", as: :new_parcels
#end financials

   resources :attendances
   resources :clients
   resources :schedullers
   resources :companies
   resources :agreements
   resources :professionals
   resources :users
   resources :card_operators
   resources :way_payments
   resources :financials

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
