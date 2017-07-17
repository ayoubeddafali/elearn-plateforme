Rails.application.routes.draw do

  # ------------- Authentication for User Model --------------
  devise_for :users, :controllers => { registrations: 'registrations' }
  get '/users/edit_profile' => 'users#edit_profile'

  # ----------------------------------------------------------

  # -------- Home Routes ----------
  root 'home#index'
  get '/about' => 'home#about'
  get '/contact' => 'home#contact'
  # --------------------------------

  # --------- Courses & Categories Routes  -----------------------------------
  post '/categories/get_category' => 'categories#get_category'
  post '/search' => 'search#search_for'
  get '/search/(:input)' => 'search#get_result'
  get '/courses/:id/add_like' => 'courses#add_like'
  get '/enrolls/:course_id/:user_id' => 'enrolls#add' , as: 'enroll'
  get '/mycourses/:user_id' => 'enrolls#user_courses' , as: 'user_courses'

  resources :categories do
    resources :courses
  end

  # -----------------------------------------------------------------------------

  # ------------------ Admin Routes  ---------------------------------
  post '/universities/create' => 'universities#create'
  get '/settings/' => 'admin#index'
  get '/settings/users' => 'admin#users'
  get '/settings/universities' => 'admin#universities'
  delete '/settings/courses/:id' => 'admin#delete_course'
  delete '/settings/users/:id' => 'admin#delete_user'
  delete '/settings/universities/:id' => 'admin#delete_university'
  # ---------------------------------------------------------------------

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
