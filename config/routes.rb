Andesconexion::Application.routes.draw do
  
  devise_for :users
  root :to => "sites#index"
  match "/admin", :controller => "admin/site", :action => "index"
  namespace "admin" do
    #resources :travel_packages
    resources :countries
    resources :categories do
      member do
        get 'show_tours'
        get 'sub_categories'
      end
      resources :tours
      collection do 
        put 'update_order'
        put 'update_status'
      end
    end
    resources :tours
    resources :hotels
    resources :clients
    resources :assets do
      collection do
        get 'index_new'
      end
    end
    resources :last_minute_offers do
      collection do 
        put 'update_order'
        put 'update_status'
      end
    end
    resources :private_services do 
      resources :travel_packages 
      collection do
        get 'sales_guide'
      end
    end
    resources :travel_packages
    resources :standalone_pages do
      collection do 
        put 'update_order'
      end
    end
  end
  resources :last_minute_offers
  
  
  
  
  
  resources :standalone_pages, :only => [:show]
  
  
  match ":main_category/:sub_category", :controller => 'categories', :action => "show_info_sub_category", :as => "nested_categories"
  match ":main_category/:sub_category/:tour", :controller => 'tours', :action => "show", :as => "tours"
  match ":main_category/", :controller => 'categories', :action => "show_info", :as => "first_level_category"
  
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
  root :to => 'sites#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
