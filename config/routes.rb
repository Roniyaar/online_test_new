OnlineTest::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  root :to => 'homes#index'
  resources :homes, :only => [:index]
  resources :questions do
    collection do
      get 'choices'
    end
  end
  resources :answers
  resources :categories
  resources :quizzes do
    collection do
      get 'index'
      get 'question'
      get 'finish'
      get 'start'
      post 'start'
      post 'question'
      post 'exam'
      get 'finish_exam'
      post 'check_descriptive_answers'
      get 'question_back_button'
      # post 'question_back_button'
    end
    member do
      get 'start'
    end
  end

  resources :descriptives
  match '/admin/questions/choices' =>  'admin/questions#questions_choices',  :via => 'post', :as => :admin_question_type_choices
  # match '/admin/descriptives/accept' =>  'admin/descriptives#descriptives_accept',  :via => 'post', :as => :admin_descriptive_accept  
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
