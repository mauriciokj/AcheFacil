AcheFacil::Application.routes.draw do

  devise_for :admins

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  get 'ambientes/vincula_prateleira'

  resources :empresas do as_routes end

  match "pesquisa_produto_por_codigo_de_barra" => "produtos#pesquisa_produto_por_codigo_de_barra"
  match 'pesquisa/:valor/:tipo', :to => 'produtos#pesquisa', :as => 'pesquisa'
  get 'produtos/seleciona_prateleira'
  match 'vincular_produtos' => 'prateleiras#vincular_produtos'



  resources :produtos do as_routes end

  resources :niveis do as_routes end



  match 'posiciona/:id', :to => 'ambientes#posiciona', :as => 'posiciona'
  match 'seleciona_prateleira_produto/:id', :to => 'prateleiras#seleciona_prateleira_produto', :as => 'seleciona_prateleira_produto'



  resources :ambientes do as_routes end

  resources :prateleiras do as_routes end



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
   root :to => 'ambientes#seleciona_ambiente'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
